# frozen_string_literal: true

class ResourcesController < ApplicationController
  before_action :authorize_user
  before_action :find_resource, except: %i[new create]
  before_action :find_resource_post, except: %i[destroy update]

  def new
    @resource = Resource.new
    respond_to do |format|
      format.js
    end
  end

  def create
    resource = @post.resources.new(resource_params)
    if resource.save
      redirect_to post_path(params[:post_id])
    else
      flash[:error] = 'Invalid input: must include both title and url.'
      redirect_to new_post_resource_path
    end
  end

  def destroy
    @resource.destroy
    redirect_to post_path(params[:post_id])
  end

  def update
    if @resource.update_attributes(resource_params)
      redirect_to post_path(params[:post_id])
    else
      flash[:error] = 'Invalid input: must include both title and content.'
      redirect_to post_path(params[:post_id])
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :url)
  end

  def find_resource
    @resource = Resource.find(params[:id])
  end

  def find_resource_post
    @post = Post.find(params[:post_id])
  end
end
