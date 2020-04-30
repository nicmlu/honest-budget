class Transaction < ApplicationRecord
  belongs_to :budget
  belongs_to :user
  has_one :category
  
  accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].blank? }
  

  validates :store_name, presence: true 
  validates :amount, presence: true 
  validates :date, presence: true 

    # def category_attributes=(category)
    # self.category = Category.find_or_create_by(name: category[:name])
    # end 

end
