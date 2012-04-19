class RegistrationsController < Devise::RegistrationsController
  include Wiki::Controllers::Sidebar::CommonSidebar
end
