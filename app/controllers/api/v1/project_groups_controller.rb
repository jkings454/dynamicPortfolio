class Api::V1::ProjectGroupsController < Api::V1::BaseController
  def show
    project_group = ProjectGroup.find(params[:id])

    render(json: Api::V1::ProjectGroupSerializer.new(project_group).to_json)
  end
end
