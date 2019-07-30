Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/events', to: 'issues#create'
      get '/issues/:id/events', to: 'events#index'
    end
  end
end
