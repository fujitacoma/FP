Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :users
  resources :events do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
end
