# coding: utf-8
class HomeController < ApplicationController
  include Wiki::Controllers::Sidebar::HomeSidebar
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Home
  def index
    @newest_entries = Entry.all

    tag = Tag.find_by_name("活动通知")

    @activities = tag.topics.order("updated_at desc").limit(5)

    render "/index"
  end
end
