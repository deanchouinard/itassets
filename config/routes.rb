Itassets::Application.routes.draw do

  # resources :users
  
  resources :sessions, :only => [:new, :create, :destroy]

  match '/signup', :to => 'users#new', :via => [:get, :post]
  match '/signin', :to => 'sessions#new', :via => [:get, :post]
  match '/signout', :to => 'sessions#destroy', :via => [:get, :post]
  
  match '/contact', :to => 'pages#contact', :via => [:get, :post]
  match '/about', :to => 'pages#about', :via => [:get, :post]
  match '/help', :to =>  'pages#help', :via => [:get, :post]

  match 'admin/login',  :to => 'admin#login', :via => [:get, :post]
  match '/admin',   :to => 'admin#index', :via => [:get, :post]
  match '/admin/logout',  :to => 'admin#logout', :via => [:get, :post]
  
  root :to => 'pages#home'
  
  resources :software_allocations

  resources :tape_moves

#  resources :tapes, :has_many => :tape_moves
  resources :tapes

  resources :ticket_actions

#  resources :tickets, :has_many => :ticket_actions
  resources :tickets


  resources :softwares

  resources :lookups

  resources :computers

  # resources :offices

  resources :sites

 
  resources :users 

  resources :computer_allocations

  
  resources :offices do
    resources :computer_allocations
  end
  
    resources :companies

  

  # connect ':controller/:action/:id'
  # connect ':controller/:action/:id.:format'
end
