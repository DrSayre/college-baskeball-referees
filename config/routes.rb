Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    jsonapi_resources :teams
    jsonapi_resources :referees
    jsonapi_resources :games
    jsonapi_resources :referee_team_stats
    jsonapi_resources :referee_assignments
  end
end
