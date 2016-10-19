Rails.application.routes.draw do
  resources :courses, only: [:index] do
    resources :recipes
  end
  resources :recipes
end
