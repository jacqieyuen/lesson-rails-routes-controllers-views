class CourseRecipesController < RecipesController
  before_action :set_course

protected
  def get_recipes
    if @course.nil?
      @recipes = []
      @message = "Course Cannot Be Found"
    else
      @recipes = @course.recipes
      @message = "No Recipes Found" if @recipes.empty?
    end
  end

private
  def set_course
    @course = Course.find_by(name: params[:course_id])
  end
end
