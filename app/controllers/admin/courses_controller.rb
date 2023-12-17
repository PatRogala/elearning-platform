class Admin::CoursesController < Admin::ApplicationController
  def index
    @courses = Course.all
  end
end
