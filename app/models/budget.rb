class Budget < ApplicationRecord
  belongs_to :user
  has_many :categories 
  accepts_nested_attributes_for :categories 
end
