class ProjectsController < ApplicationController
  include ApplicationHelper

  def index
    @projects = Project.all
  end

  def new
    authorize_user
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

  def destroy
    authorize_user
    project = Project.find_by(id: params[:id])
    project.destroy
    redirect_to projects_path
  end

  def edit
    authorize_user
    @project = Project.find(params[:id])
  end

  def update
    authorize_user
    project = Project.find(params[:id])
    if project.update_attributes(project_params)
      redirect_to projects_path
    else
      flash[:error] = "Invalid input: must include both title and url."
      redirect_to edit_project_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :url, :software, :description)
  end
end