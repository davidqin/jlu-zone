class Wiki::WikiController < ApplicationController
  include Wiki::Controllers::Sidebar::WikiSidebar
  def index
    drop_breadcrumb(itext("navigation.wiki"), wiki_path)
    render "/wiki/index"
  end
end