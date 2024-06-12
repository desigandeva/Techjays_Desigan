Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "application#index"

  namespace :api do
    namespace :v1 do
      # students
      get '/students/index'
      get '/students/new'
      get '/student/edit' => 'students#edit'
      get '/student/show' => 'students#show'
      post 'create' => 'students#create'
      patch 'update' => 'students#update'
      get '/student/destroy' => 'students#destroy'
      get '/students/publish_score' => 'students#publishScore'

      # subjects
      resources :subjects
    
      # scores
      get '/scores/index'
      get '/scores/display'
      get '/scores/new'
      post 'addScore' => 'scores#addScore'

    end
  end
  # get '/api/v1/students/index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

end