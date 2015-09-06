class ProjectsController < ApplicationController
  include ApplicationHelper

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    authorize_user
    project = Project.new(project_params.merge(admin_id: session[:admin_id]))
    if project.save
      redirect_to projects_path
    else
      flash[:error] = "Invalid input: must include both title and url."
      redirect_to new_project_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :url, :description)
  end
end