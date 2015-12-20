Rails.application.routes.draw do
  devise_for :users
  resources :tags, param: :tag_id, only: [:index, :show]
  resources :users, only: [:show]
  resources :prototypes do
    scope module: :prototypes do
      resources :likes, only:[:create, :destroy]
      resources :comments, only:[:create]
    end
    collection do
      get :popular
    end
  end
  resources :memos, only: [:index, :create, :destroy]
  root to: "prototypes#index"
end
