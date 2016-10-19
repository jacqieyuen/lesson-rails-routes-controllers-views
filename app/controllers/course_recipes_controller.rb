class CourseRecipesController < RecipesController
  before_action :set_course

private
  def get_recipes
    if not @course.nil?
      @recipes = @course.recipes
      @message = "No Recipes Found" if @recipes.empty?
    end
  end

  def get_recipe
    if not @course.nil?
      @recipe = @course.recipes.find_by(id: params[:id])
      @message = "Cannot Find Recipe With ID #{params[:id]}" if @recipe.nil?
    end
  end

  def set_course
    @course = Course.find_by(name: params[:course_id])
    if @course.nil?
      @recipes = []
      @recipe  = nil
      @message = "Course Cannot Be Found"
    end
  end

  def set_parent_path
    @parent_resource = "/courses"
    @parent_path     = "/courses/#{params[:course_id]}"
  end
end
