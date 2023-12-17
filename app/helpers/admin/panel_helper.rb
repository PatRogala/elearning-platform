module Admin::PanelHelper
  def panels
    [
      { title: "Courses", path: admin_path },
    ]
  end
end
