class UsersController < ApplicationController
  def menu
    @users = User.all
    drop_breadcrumb(itext("user.menu"))
    render "menu"
  end
end