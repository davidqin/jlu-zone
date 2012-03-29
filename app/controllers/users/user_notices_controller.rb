class Users::UserNoticesController < ApplicationController

  before_filter :authenticate_user!

  respond_to :html, :js, :only => [:destroy, :mark_all_as_read]

  def index
    user = User.find_by_nickname(params[:id])
    @notices = user.notices.all.paginate(:page => params[:page], :per_page => 10)
    drop_breadcrumb(itext("notice.notice_center"), user_notices_path)
    render "/users/notices/notices"
  end

  def create
  end

  def mark_one_read
    @notice = current_user.notices.find(params[:id])
    @notice.read = true
    @notice.save!
    respond_with do |format|
      format.html { redirect_referrer_or_default user_notices_path }
      format.js   { render "users/notices/mark_one_read",:layout => false  }
    end
  end

  def mark_one_unread
    @notice = current_user.notices.find(params[:id])
    @notice.read = false
    @notice.save!
    respond_with do |format|
      format.html { redirect_referrer_or_default user_notices_path }
      format.js { render "users/notices/mark_one_unread",:layout => false }
    end
  end

  def mark_all_read
    current_user.notices.update_all("read = 'true'", ['read = ?', false])
    respond_with do |format|
      format.html { redirect_referrer_or_default user_notices_path }
      format.js   { render "users/notices/mark_all_read",:layout => false  }
    end
  end

  def destroy
    @notice = current_user.notices.find(params[:id])
    @notice.destroy
    respond_with do |format|
      format.html { redirect_referrer_or_default user_notices_path }
      format.js   { render "users/notices/destroy", :layout => false       }
    end
  end

  #messages_to_you, @_you, who_reply_you
end
