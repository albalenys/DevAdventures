# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :find_project, except: %i[new create]

  def new
    @project = Project.new
    ordered_projects = Project.all.order(created_at: :desc)
    @projects = ordered_projects.paginate(page: params[:page], per_page: 4)

    # Necessary for modal functionality
    @parent_element = '#projects-container';
    @modal_content_file = 'projects/form';
    @modal_close_file = 'projects/index';

    respond_to do |format|
      format.js { render 'shared/modal.js.erb' }
    end
  end

  def create
    project = Project.new(project_params.merge(admin_id: session[:admin_id]))
    if project.save
      redirect_to '/#projects'
    else
      flash[:error] = 'Invalid input: must include both title and url.'
      redirect_to new_project_path
    end
  end

  def destroy
    @project.destroy
    redirect_to '/#projects'
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to '/#projects'
    else
      flash[:error] = 'Invalid input: must include both title and url.'
      redirect_to edit_project_path
    end
  end

  def edit
    ordered_projects = Project.all.order(created_at: :desc)
    @projects = ordered_projects.paginate(page: params[:page], per_page: 4)

    # Necessary for modal functionality
    @parent_element = '#projects-container';
    @modal_content_file = 'projects/form';
    @modal_close_file = 'projects/index';

    respond_to do |format|
      format.js { render 'shared/modal.js.erb' }
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :url, :github, :software, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
