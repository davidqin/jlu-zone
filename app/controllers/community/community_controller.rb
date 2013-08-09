class Community::CommunityController < ApplicationController
  include Wiki::Controllers::Sidebar::CommunitySidebar
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Community

  def index
    @topics = Topic.order("updated_at desc").all.paginate(:page => params[:page], :per_page => 15 )
    @page_title = itext("navigation.community")
    render "community/index"
  end
end