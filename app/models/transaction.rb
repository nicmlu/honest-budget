class Transaction < ApplicationRecord
  belongs_to :budget
  belongs_to :user
  has_many :transaction_categories
  has_many :categories, through: :transaction_categories
  accepts_nested_attributes_for :categories 

  def categories_attributes=(attribute)
    self.category = Category.find_or_create_by(name: attribute[:name])
    self.category.update(attribute)
  end

end
