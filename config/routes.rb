Rails.application.routes.draw do
root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create' 
 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/google_oauth2/callback' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  # resources :transaction_categories
  resources :categories
  resources :transactions

  resources :budgets do
    resources :transactions, only: [:new, :show]
    resources :categories, only: [:new, :show]
  end 

  resources :users do
    resources :transactions, only: [:show, :index, :new, :create, :edit, :update]
    resources :budgets, only: [:show, :index, :new, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
