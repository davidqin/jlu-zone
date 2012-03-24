class Wiki::WikiController < ApplicationController
  include Wiki::Controllers::Sidebar::WikiSidebar
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Wiki
  
  def index
    drop_breadcrumb(itext("navigation.wiki"), wiki_path)
    render "/wiki/index"
  end
end