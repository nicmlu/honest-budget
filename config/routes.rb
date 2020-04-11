Rails.application.routes.draw do
  resources :transaction_categories
  resources :budgets
  resources :categories
  resources :transactions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
