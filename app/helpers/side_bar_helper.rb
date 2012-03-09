module SideBarHelper
  def render_controller_sidebar
    path = self.controller_sidebar_path
    render path
  rescue ActionView::MissingTemplate
  end
end