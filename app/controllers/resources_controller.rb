# frozen_string_literal: true

class ResourcesController < ApplicationController
  before_action :authorize_user
  before_action :find_resource, except: %i[new create]
  before_action :find_resource_post, except: %i[destroy]

  def new
    @resource = Resource.new
    respond_to :js
  end

  def create
    @resource = @post.resources.new(resource_params)
    if @resource.save
      respond_to :js
    else
      flash[:error] = 'Invalid input: must include both title and url.'
      redirect_to post_path(params[:post_id])
    end
  end

  def destroy
    @resource.destroy
    respond_to :js
  end

  def edit
    respond_to :js
  end

  def update
    unless @resource.update_attributes(resource_params)
      flash[:error] = 'Invalid input: must include both title and content.'
    end
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
