# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :find_project, except: %i[new create]

  def new
    @project = Project.new

    respond_to do |format|
      @modal_content_partial = 'projects/form';
      @modal_heading = 'New Project';

      format.js { render 'shared/modal.js.erb' }
    end
  end

  def create
    @project = Project.new(project_params.merge(admin_id: session[:admin_id]))
    if @project.save
      respond_to :js
    else
      flash[:error] = 'Invalid input: must include both title and url.'
      redirect_to new_project_path
    end
  end

  def destroy
    @project.destroy
    respond_to :js
  end

  def update    
    if @project.update_attributes(project_params)
      respond_to :js
    else
      flash[:error] = 'Invalid input: must include both title and url.'
      redirect_to edit_project_path
    end
  end

  def edit
    respond_to do |format|
      @modal_content_partial = 'projects/form';
      @modal_heading = 'Edit Project';

      format.js { 
        render 'shared/modal.js.erb' 
      }
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
