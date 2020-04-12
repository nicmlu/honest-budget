class User < ApplicationRecord
    has_many :transactions
    has_many :budgets 
    has_secure_password 
end
