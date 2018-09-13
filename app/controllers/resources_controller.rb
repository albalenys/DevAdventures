# frozen_string_literal: true

class ResourcesController < ApplicationController
  before_action :authorize_user
  before_action :find_resource, except: %i[new create]
  before_action :find_resource_post, except: %i[destroy update]

  def new
    @resource = Resource.new
    respond_to :js
  end

  def create
    resource = @post.resources.new(resource_params)
    if resource.save
    else
      flash[:error] = 'Invalid input: must include both title and url.'
    end
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @resource.destroy
    respond_to :js
  end

  def update
    if @resource.update_attributes(resource_params)
    else
      flash[:error] = 'Invalid input: must include both title and content.'
    end
    redirect_to post_path(params[:post_id])
  end

  def edit
    respond_to :js
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
