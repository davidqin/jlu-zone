module SideBarHelper
  def render_controller_sidebar
    path = self.controller_sidebar_path
    render path
  rescue ActionView::MissingTemplate
  end

  def render_info_statistics
    contents_tag :ul, :class => "nav nav-list" do |contents|
      contents << content_tag(:h2, itext("info_statistics"))
      contents << content_tag(:li, users_statistics)
      contents << content_tag(:li, entries_statistics)        
    end
  end

  private

  def users_statistics
    itext("users_statistics", :users => User.all.size)
  end

  def entries_statistics
    itext("entries_statistics", :entries => Entry.all.size)
  end
end