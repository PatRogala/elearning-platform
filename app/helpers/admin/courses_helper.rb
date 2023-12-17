module Admin::CoursesHelper
  def preview_description(course)
    truncate(course.description, length: 50)
  end
end
