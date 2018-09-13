# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :find_tag, except: %i[new create]
  before_action :find_tag_post_or_project, except: %i[show destroy]


  def show
    @posts_by_month = @tag.posts.public_posts.order(created_at: :desc).sort_by_month
    ordered_projects = @tag.projects.all.order(created_at: :desc)
    @projects = ordered_projects.paginate(page: params[:page], per_page: 4)
  end

  def new
    @tag = Tag.new
    respond_to :js
  end

  def create
    @tag = Tag.find_or_create_by(name: params[:tag][:name])
    if @taggable.tags << @tag
      respond_to :js
    else
      flash[:error] = 'Invalid input: must include both title and url.'
      redirect_from_error
    end
  end

  def destroy
    @tag.destroy
    respond_to :js
  end

  private

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def find_tag_post_or_project
    if params[:post_id]
      @taggable = Post.find(params[:post_id])
    else
      @taggable = Project.find(params[:project_id])
    end
  end

  def redirect_from_error
    if params[:post_id]
      redirect_to post_path(params[:post_id])
    else
      redirect_to project_path(params[:project_id])
    end
  end
end
