class Admin::ApplicationController < ApplicationController
  layout "admin"
  helper_method :admin_current_user

  def current_user
    @current_user ||= AdminUser.find_by(id: session[:admin_user_id]) if session[:admin_user_id]
  end

end
