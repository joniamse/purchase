Rails.application.routes.draw do
  devise_for :users
  resources :item_carts
  resources :carts
  resources :brands
  resources :components

  devise_scope :user do
    authenticated :user do
      root "components#index"
    end

    unauthenticated :user do
      root "devise/sessions#new", as: :user_unregistered
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
