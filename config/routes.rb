Rails.application.routes.draw do

  scope :api do
    resources :kategoris, only: [:index, :show, :create, :update, :destroy], path: "kategori"
    resources :menus, only: [:index, :show, :create, :update, :destroy], path: "menu"

    resources :orders, only: [:index, :show, :create, :update, :destroy], path: "order" do
      resources :order_menus, only: [:index, :show, :create, :update, :destroy], :path => "menu"
    end

    post 'order/:id/paid', to: 'orders#paid'

    get 'report', to: 'reports#index'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: redirect('/api/menu')
end