Rails.application.routes.draw do
  namespace :api do
    resources :movies
  end
end
