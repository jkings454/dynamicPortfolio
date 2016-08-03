class ProjectGroupsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :destroy, :edit, :update]
  def index
    @project_groups = ProjectGroup.all
  end
  def show
    @project_group = ProjectGroup.find(params[:id])
    @projects = Project.where(:project_group_id => @project_group.id)
  end
  def new
    @project_group = ProjectGroup.new
  end
  def create
    @project_group = ProjectGroup.new(project_group_params)
    if @project_group.save
      flash[:success] = 'Project Group Successfully Created'
      redirect_to '/classes'
    else
      render 'new'
    end
  end
  def destroy
    @project_group = ProjectGroup.find(params[:id])
    @project_group.destroy
    flash[:success] = 'Project Group Successfully Destroyed'
    redirect_to '/classes'
  end
  def edit
    @project_group = ProjectGroup.find(params[:id])
  end
  def update
    @project_group = ProjectGroup.find(params[:id])
    if @project_group.update(project_group_params)
      flash[:success] = 'Project Group Successfully Updated'
      redirect_to '/classes'
    else
      render 'edit'
    end
  end
  private
  def project_group_params
    params.require(:project_group).permit(:title, :image_url, :description)
  end
end
