class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :book_name, null:true
      t.integer :student_id
      t.timestamps
    end
  end
end
