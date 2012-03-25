class Community::CommunityController < ApplicationController
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Community
  def index
    @topics = Topic.all.paginate(:page => params[:page], :per_page => 10)
    drop_breadcrumb(itext("navigation.community"), community_path)
    #drop_breadcrumb(current_category.name)
    render "community/index"
  end
end