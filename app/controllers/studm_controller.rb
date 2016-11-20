class StudmController < ApplicationController
  before_action :authenticate_user!
  #show all student records
  def index
     
    @studm = Student.all
    authorize! :index, @studm
   
  end
  
  #creating new record
  def new
    
    @studm = Student.new
    authorize! :new, @studm
  end

  def create
    @studm = Student.new(studm_params)
    authorize! :create,@studm
    if @studm.save
      redirect_to :action => "index"
    else
      render :action => "create"
    end
  end

  #updating student information
  def edit
   @studm = Student.find(params[:id])
   authorize! :edit,@studm
  end
  
  def update
    @studm = Student.find(params[:id])
    authorize! :update,@studm
    if @studm.update_attributes(studm_params)
      redirect_to :action => 'show',:id=> @studm.id
    else
      render :action => 'update'
    end
  end
  
 
# to show the record
  def show
    @studm = Student.find(params[:id])
    authorize! :show, @studm
  end

# to delete the record
  def delete
    @studm = Student.find(params[:id]).destroy
    authorize! :delete, @studm
    redirect_to :action => "index"
end

# display the all student fees record
  def fees_details
    @studm = Student.all
    
  end

# editing the fee details   
  def fee_edit
    @studm = Student.find(params[:id])
    authorize! :fee_edit, @studm
  end
  
   #fees details edit
  def update_fees
     @studm = Student.find(params[:id])
     authorize! :update_fees, @studm
    if @studm.update_attributes(studm_params)
      @remaining_fees = @studm.total_fees - @studm.paid_fees
      @studm.remaining_fees = @remaining_fees
      @studm.save
      redirect_to :action => 'fees_details',:id=> @studm.id
    else
      render :action => 'update_fees'
    end
  end

#display all the attendance records
  def attendance_details
      @studm = Student.all
  end
  
#editing the attendance details
  def attendance_edit
    @studm = Student.find(params[:id])
    authorize! :attendance_edit, @studm
  end
  
#update the attendance details
  def attendance_update
     @studm = Student.find(params[:id])
     authorize! :attendance_update, @studm
     if @studm.update_attributes(studm_params)
      @attendance = @studm.attended_lectures * 100
      @attendance = @attendance / @studm.total_lectures
      @studm.attendance = @attendance
      @studm.save
      redirect_to :action => 'attendance_details',:id=> @studm.id
    else
      render :action => 'attendance_edit'
    end
  end
  
  #show all library details 
  def library_details
    @studm = Student.all

  end
  
  #show book details 
  def books_show
    
     @studm = Student.find(params[:id])
     if @studm.books.any?
     @books = @studm.books
     end
     
  end
  
  #issue new book
  def new_book
    @studm = Student.find(params[:id])
    authorize! :new_book, @studm
    @book = Book.new
    @book.student_id = @studm.id
  end
  
  def issue_book
     @studm = Student.find(params[:id])
     authorize! :issue_book, @studm
     @book = Book.new(books_params)
    if @book.save
       count = @studm.book_count
       @studm.book_count = count + 1
       @studm.save
      redirect_to :action => "library_details"
    else
      render :action => "new_book"
    end
  end
  
  #return the issue book
  def return_book
     
     @studm = Student.find(params[:id])
     authorize! :return_book, @studm
     if @studm.books.any?
     @books = @studm.books
     end
     
  end
  def delete_book
        @book = Book.find(params[:id])
        @studm = Student.find(@book.student_id)
        authorize! :delete_book, @studm
        @book.destroy
       count = @studm.book_count
       @studm.book_count = count - 1
       @studm.save
      redirect_to :action => 'books_show',:id => @studm.id
    
  end

  
# all the fields in studm table
 def studm_params
    params.require(:student).permit(:name, :std, :address,:total_fees, :paid_fees, :remaining_fees, :attendance, :total_lectures, :attended_lectures, :book_count, :dob)
  end
  #all fields in books table
  def books_params
  params.require(:book).permit(:book_name,:student_id)
  end
end
