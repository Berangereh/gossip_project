Rails.application.routes.draw do
  

  root to:'gossips#index'

  get 'static_pages/welcome/:first_name', to: 'static_pages#welcome' #cela créé un helper pour que si le nom de page change, il trouve quand même la view à afficher
  get 'static_pages/team', to: 'static_pages#team'
  get 'static_pages/contact', to: 'static_pages#contact'
  get 'static_pages/author/:author_id', to: 'static_pages#author', as: 'author'

  resources :gossips do
    resources :comments
    end

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show]

  resources :cities, only: [:show]


end
