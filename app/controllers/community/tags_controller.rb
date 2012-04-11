class Community::TagsController < ApplicationController
  include Wiki::Controllers::Sidebar::CommunitySidebar
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Community

  def index
    @tag = Tag.find_by_number(params[:tag_id])
    @topics = @tag.topics.order("updated_at desc").all.paginate(:page => params[:page], :per_page => 20)
    drop_breadcrumb(itext("navigation.community"), community_path)
    drop_breadcrumb(itext("topic.tag", :tag_name => @tag.name))
    render "community/index"
  end
end