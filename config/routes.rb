Rails.application.routes.draw do
  resources :contacts do
    collection { post :upload }
  end
  devise_for :users
  get "home/index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
