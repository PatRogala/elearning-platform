module Admin::PanelHelper
  def panels
    [
      { title: "Courses", path: admin_courses_path },
    ]
  end
end
