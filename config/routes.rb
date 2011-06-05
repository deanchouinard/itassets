Itassets::Application.routes.draw do
  resources :software_allocations

  resources :tape_moves

  resources :tapes, :has_many => :tape_moves

  resources :ticket_actions

  resources :tickets, :has_many => :ticket_actions

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
