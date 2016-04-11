class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def project_group_list
    @project_groups = ProjectGroup.all
  end
  helper_method :project_group_list
end
