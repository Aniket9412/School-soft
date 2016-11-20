class Student < ApplicationRecord
  
  has_many :books
  
    class << columns_hash['date']
    def type
      :date
    end
  end
end
