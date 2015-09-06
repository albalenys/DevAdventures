class PostsController < ApplicationController
  include ApplicationHelper

  def index
    @posts_by_month = Post.sort_by_month
  end

  def show
    @post = Post.find_by(id: params[:id])
    @next_post = Post.find_by(id: @post.id + 1)
    @previous_post = Post.find_by(id: @post.id - 1)
  end

  def new
    authorize_user
    @post = Post.new
  end

  def create
    authorize_user
    post = Post.new(post_params.merge(admin_id: session[:admin_id]))
    if post.save
      redirect_to root_path
    else
      flash[:error] = "Invalid input: must include both title and content."
      redirect_to new_post_path
    end
  end

  def destroy
    authorize_user
    post = Post.find_by(id: params[:id])
    post.destroy
    redirect_to posts_path
  end

  def edit
    authorize_user
    @post = Post.find(params[:id])
  end

  def update
    authorize_user
    post = Post.find(params[:id])
    if post.update_attributes(post_params)
      redirect_to post_path(post.id)
    else
      flash[:error] = "Invalid input: must include both title and content."
      redirect_to edit_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end