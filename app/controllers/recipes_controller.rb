class RecipesController < ApplicationController
  before_action :set_parent_path

  def index
    get_recipes
    render 'recipes/index'
  end

  def show
    get_recipe
    render 'recipes/show'
  end

  def new
    @recipe  = flash[:recipe].nil? ? Recipe.new :  Recipe.new(flash[:recipe])
    @errors  = flash[:errors]
    @courses = Course.order(:name).pluck(:name, :id)
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      flash[:recipe] = @recipe
      flash[:errors] = @recipe.errors.messages
      redirect_to new_recipe_path
    end
  end

protected
  def get_recipes
    @recipes = Recipe.all
    @message = "No Recipes Found" if @recipes.empty?
  end

  def get_recipe
    @recipe  = Recipe.find_by(id: params[:id])
    @message = "Cannot Find Recipe With ID #{params[:id]}"
  end

private
  def set_parent_path
    @parent_resource = "/"
    @parent_path     = ""
  end

  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :servings, :course_id)
  end
end
