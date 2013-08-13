# coding: utf-8
class HomeController < ApplicationController

  layout :false
  def index
    render 'home/index'
  end

  def about
    render 'home/about'
  end

  def feedback
    render 'home/feedback'
  end
end
