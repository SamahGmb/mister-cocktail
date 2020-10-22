Rails.application.routes.draw do
  devise_for :users
  root to: 'cocktails#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
    collection do
      get :my_cocktails
    end
  end

  resources :doses, only: [:destroy]
end
