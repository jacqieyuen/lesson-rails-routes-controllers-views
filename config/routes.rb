Rails.application.routes.draw do
  resources :courses, only: [:index] do
    resources :recipes, only: [:index, :show], controller: 'course_recipes'
  end

  resources :recipes
end
