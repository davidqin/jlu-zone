# coding: utf-8
class HomeController < ApplicationController
  include Wiki::Controllers::Sidebar::HomeSidebar
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Home
  def index
    @page_title = "Home"
    do_not_use_sidebar
  end

  def about
    do_not_use_sidebar
    @page_title = itext("navigation.about_me")
  end
end
