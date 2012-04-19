class SessionsController < Devise::SessionsController
  include Wiki::Controllers::Sidebar::CommonSidebar
end
