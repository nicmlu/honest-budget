Rails.application.routes.draw do
root 'sessions#home'

  get '/signup' => 'users#new', as: 'signup'
  post '/signup' => 'users#create' 
 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/transactions/find' => 'transactions#find'

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
