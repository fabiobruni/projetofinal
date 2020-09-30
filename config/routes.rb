Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :submitted_text, only [ :index, :edit, :new, :create, :destroy ] do
    resources :translated_text, only [ :index, :new, :edit, :update] do
      resources :evaluation, only [:new, :show, :edit, :update]
end
