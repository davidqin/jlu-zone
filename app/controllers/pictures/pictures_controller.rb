# coding: utf-8
class Pictures::PicturesController < ApplicationController
  include Wiki::Controllers::TabsHighLight::Base
  include Wiki::Controllers::TabsHighLight::Pictures

  def index
    drop_breadcrumb(itext("navigation.pictures"), pictures_path)
    do_not_use_sidebar
    render "pictures/index"
  end
end
