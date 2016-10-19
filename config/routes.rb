Rails.application.routes.draw do
  resources :courses, only: [:index] do
    resources :recipes, except: [:new, :edit], controller: 'course_recipes'
  end

  resources :recipes
end
