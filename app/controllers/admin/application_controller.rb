class Admin::ApplicationController < ApplicationController
  layout "admin"
  helper_method :admin_current_user
  before_action :admin_login_required

  def admin_current_user
    @current_user ||= AdminUser.find_by(id: session[:admin_user_id]) if session[:admin_user_id]
  end

  def admin_login_required
    redirect_to login_url unless admin_current_user
  end
end
