class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def project_group_list
    @project_groups = ProjectGroup.all
  end
  helper_method :project_group_list

  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def require_user
     redirect_to '/login' unless current_user
  end

  def require_admin
     redirect_to '/' unless current_user.admin?
  end
end
