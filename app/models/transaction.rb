class Transaction < ApplicationRecord
  belongs_to :budget
  belongs_to :user
  belongs_to :category
  
  accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].blank? }

end
