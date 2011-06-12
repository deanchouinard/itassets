Itassets::Application.routes.draw do

  match 'admin/login',  :to => 'admin#login'
  match '/admin',   :to => 'admin#index'
  match '/admin/logout',  :to => 'admin#logout'
  
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

  resources :offices

  resources :sites

  resources :users

  resources :companies

  # connect ':controller/:action/:id'
  # connect ':controller/:action/:id.:format'
end
