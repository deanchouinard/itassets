Itassets::Application.routes.draw do

  # resources :users
  
  resources :sessions, :only => [:new, :create, :destroy]

  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  
  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match '/help', :to =>  'pages#help'

  match 'admin/login',  :to => 'admin#login'
  match '/admin',   :to => 'admin#index'
  match '/admin/logout',  :to => 'admin#logout'
  
  root :to => 'pages#home'
  
  resources :software_allocations

  resources :tape_moves

#  resources :tapes, :has_many => :tape_moves
  resources :tapes

  resources :ticket_actions

#  resources :tickets, :has_many => :ticket_actions
  resources :tickets

  resources :computer_allocations

  resources :softwares

  resources :lookups

  resources :computers

  # resources :offices

  resources :sites

 
  resources :users 
    resources :offices
    resources :companies

  

  # connect ':controller/:action/:id'
  # connect ':controller/:action/:id.:format'
end
