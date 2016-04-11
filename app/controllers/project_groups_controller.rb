class ProjectGroupsController < ApplicationController
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
    @project_group = ProjectGroup.new(project_params)
    if @project_group.save
      redirect_to '/classes'
    else
      render 'new'
    end
  end
  private
  def project_group_params
    params.require(:project_group).permit(:title, :image_url, :description)
  end
end
