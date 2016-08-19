class Api::V1::ProjectsController < Api::V1::BaseController
  def show
    @project = Project.find(params[:id])

    render(json: @project)
  end
end
