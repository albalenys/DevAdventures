class ProjectsController < ApplicationController
  before_filter :authorize_user, except: [:index]
  before_filter :find_project, except: [:index, :new, :create]

  def index
    projects = Project.all.order(created_at: :desc)
    @projects = projects.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params.merge(admin_id: session[:admin_id]))
    if project.save
      redirect_to projects_path
    else
      flash[:error] = "Invalid input: must include both title and url."
      redirect_to new_project_path
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def update
    if @project.update_attributes(project_params)
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

  def find_project
    @project = Project.find(params[:id])
  end
end
