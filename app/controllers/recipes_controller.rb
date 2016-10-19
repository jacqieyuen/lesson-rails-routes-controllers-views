class RecipesController < ApplicationController
  def index
    get_recipes
    render 'recipes/index'
  end

protected
  def get_recipes
    @recipes = Recipe.all
    @message = "No Recipes Found" if @recipes.empty?
  end
end
