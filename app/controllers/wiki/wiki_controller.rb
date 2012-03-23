class Wiki::WikiController < ApplicationController
  include Wiki::Controllers::Sidebar::WikiSidebar
  before_filter :set_menu_active
  
  def index
    drop_breadcrumb(itext("navigation.wiki"), wiki_path)
    render "/wiki/index"
  end

  protected

  def set_menu_active
    @current = @current = ['/wiki']
  end
end