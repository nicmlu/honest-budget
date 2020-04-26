class Budget < ApplicationRecord
  belongs_to :user 
  has_many :transactions, foreign_key: "transaction_id", class_name: "Transaction"
  validates :name, uniqueness: true
end
