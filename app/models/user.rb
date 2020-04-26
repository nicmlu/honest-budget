class User < ApplicationRecord
    has_many :budgets 
    has_many :transactions
    has_many :categories, through: :transactions
    has_secure_password 
    validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true
end
