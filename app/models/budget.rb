class Budget < ApplicationRecord
  belongs_to :user 
  has_many :transactions
  has_many :categories, through: :transactions
  
  validates :name, presence: true, uniqueness: {scope: [:user_id]}
  validates :income, presence: true
  validates :expenses, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
