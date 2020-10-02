Rails.application.routes.draw do
  devise_for :users
  root to: 'submitted_texts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :submitted_texts, only: [ :index, :edit, :new, :create, :destroy, :show ] do
    resources :translated_texts, only: [ :index, :new, :create, :edit, :update , :show] do
      resources :evaluations, only: [ :new, :show, :edit, :update ]
    end
  end
  Rails.application.routes.draw do
    get 'example', to: 'pages#example'
  end
end
