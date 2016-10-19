Rails.application.routes.draw do
  resources :courses, only: [:index] do
    resources :recipes, controller: 'course_recipes'
  end

  resources :recipes
end
