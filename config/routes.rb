Rails.application.routes.draw do
  
  scope :api do
    resources :menus, only: [:index, :show, :create, :update, :destroy]
    resources :kategoris, only: [:index]
    resources :orders, only: [:index, :show, :create, :update, :destroy]
  end  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: redirect('/api/menus')
end
