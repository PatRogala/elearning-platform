class Admin::CoursesController < Admin::ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    course = Course.new(course_params)

    if course.save
      redirect_to admin_courses_path, notice: "Course created successfully!"
    else
      render :new
    end
  end

  def create
    course = Course.new(course_params)

    if course.update(course_params)
      respond_to { |format| format.turbo_stream }
    else
      render :new
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
