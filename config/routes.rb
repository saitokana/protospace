Rails.application.routes.draw do
  devise_for :users
  resources :tags, only: [:index, :show]
  resources :prototypes do
    scope module: :prototypes do
      resources :likes, only:[:create, :destroy]
      resources :comments, only:[:create]
    end
  end
  root to: "prototypes#index"
end
