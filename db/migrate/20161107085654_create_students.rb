class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :std
      t.text :address
      t.date :date
      t.date :dob
      t.integer :total_fees
      t.integer :paid_fees
      t.integer :remaining_fees
      t.integer :total_lectures
      t.integer :attended_lectures
      t.float :attendance
      t.integer :book_count,null:false,default:0
      t.timestamps 
    end
  end
end
