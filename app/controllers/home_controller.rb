class HomeController < ApplicationController
  include Wiki::Controllers::Sidebar::HomeSidebar
  def index
    @entry = Entry.new

    @newest_entries = Entry.all

    @hot_entries = Entry.all

    render "/index"
  end
end