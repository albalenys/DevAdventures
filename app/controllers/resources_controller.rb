class ResourcesController < ApplicationController
  include ApplicationHelper

  def new
    authorize_user
    @resource = Resource.new
    @post = Post.find(params[:post_id])
  end

  def create
    authorize_user
    post = Post.find(params[:post_id])
    resource = post.resources.new(resource_params)
    if resource.save
      redirect_to post_path(params[:post_id])
    else
      flash[:error] = "Invalid input: must include both title and url."
      redirect_to new_post_resource_path
    end
  end

  def destroy
    authorize_user
    resource = Resource.find_by(id: params[:id])
    resource.destroy
    redirect_to post_path(params[:post_id])
  end

  def edit
    authorize_user
    @resource = Resource.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def update
    authorize_user
    resource = Resource.find(params[:id])
    if resource.update_attributes(resource_params)
      redirect_to post_path(params[:post_id])
    else
      flash[:error] = "Invalid input: must include both title and content."
      redirect_to edit_post_resource_path
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :url)
  end
end