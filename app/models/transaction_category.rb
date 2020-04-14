class TransactionCategory < ApplicationRecord
  belongs_to :my_transaction, class_name: "Transaction", foreign_key: "transaction_id"
  belongs_to :category
end
