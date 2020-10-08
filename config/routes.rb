Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root to: 'submitted_texts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :submitted_texts, only: [ :index, :edit, :new, :create, :destroy, :show, :update ] do
    resources :translated_texts, only: [ :index, :new, :edit, :update, :create, :show, :destroy] do
    # post 'edit', to: 'translated_texts#update'
      resources :evaluations, only: [:new, :create]
    end
  end
    get 'example', to: 'pages#example'
    get 'mypage', to: 'pages#mypage'
    get 'accept', to: 'pages#accept'
    get 'confirm', to: 'pages#confirm'
end
