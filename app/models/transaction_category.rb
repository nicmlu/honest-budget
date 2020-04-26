class TransactionCategory < ApplicationRecord
  belongs_to :purchase, foreign_key: "transaction_id", class_name: "Transaction"
  belongs_to :category
end
