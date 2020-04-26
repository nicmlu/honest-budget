class Budget < ApplicationRecord
  belongs_to :user 
  has_many :transactions
  has many :categories, through: :transactions
  validates :name, presence: true, uniqueness: {scope: [:user_id]}
end
