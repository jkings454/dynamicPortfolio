class ProjectsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :update, :destroy, :edit]

  def new
    @project_group = ProjectGroup.find(params[:project_group_id])
    @project = Project.new()
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success]='Project Successfully Created!'
      redirect_to project_group_path(@project.project_group_id)
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success]='Project Successfully Destroyed!'
    redirect_to project_group_path(@project.project_group_id)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(update_project_params)
      flash[:success]='Project Successfully Updated!'
      redirect_to project_path(@project)
    else
      render project_group_path(@project.project_group_id)
    end
  end

  def show
    @project = Project.find(params[:id])
    @project_group = ProjectGroup.find(@project.project_group_id)
  end
  
  private
  def project_params
    params.require(:project).permit(:name, :description, :link, :link_type).merge(:project_group_id => params[:project_group_id])
  end
  def update_project_params
    params.require(:project).permit(:name, :description, :link, :link_type, :project_group_id )
  end
end
