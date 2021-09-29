Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  #will have to be change and setted by env when app deployed

  resources :posts
  get 'site/home'
  get 'sessions/new'
  resources :users do
    member do
      get :confirm_email
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'site/home'
  root to: 'site#home'

  get '/imageAPi', to: 'images#index'

  get '/search' => 'images#search'

  resources :writing_definitions do
    resources :image_elements

  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
end
