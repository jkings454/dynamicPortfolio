class ProjectsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :update, :destroy, :edit]
  def new
    @project_group = ProjectGroup.find(params[:project_group_id])
    @project = Project.new()
  end
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to '/classes'
    else
      render 'new'
    end
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to '/classes'
  end
  def edit
    @project = Project.find(params[:id])
  end
  def update
    @project = Project.find(params[:id])
    if @project.update(update_project_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end
  def show
    @project = Project.find(params[:id])
  end
  private
  def project_params
    params.require(:project).permit(:name, :description, :link, :link_type).merge(:project_group_id => params[:project_group_id])
  end
  def update_project_params
    params.require(:project).permit(:name, :description, :link, :link_type, :project_group_id )
  end
end
