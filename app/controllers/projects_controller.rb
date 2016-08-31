class ProjectsController < ApplicationController
  before_action :load_project, except: [:index, :create]

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    render_project
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render_project status: :created
    else
      render_errors
    end
  end

  def update
    if @project.update(project_params)
      render_project status: 226
    else
      render_errors
    end
  end

  def destroy
    if @project.destroy
      head :ok
    else
      render_project_errors "Could not destroy this project, puny human.."
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :project_active)
  end

  def render_project(status:  200)
    render json: @project, status: status
  end

  def render_project_errors(errors = nil)
    errors ||= @project.errors
    render json: { errors: errors }, status: :unprocessible_entity
  end

  def load_project
    @project = Project.find(params[:id])
  end
end
