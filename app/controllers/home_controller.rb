# coding: utf-8
class HomeController < ApplicationController
  include Wiki::Controllers::Sidebar::HomeSidebar
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Home
  def index
    @topics = Topic.order("updated_at desc").limit(10)
    render "/index"
  end
end
