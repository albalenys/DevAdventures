class PostsController < ApplicationController
  before_filter :authorize_user, except: [:show]
  before_filter :find_post, except: [:new, :create]

  def show
    @next_post = Post.find_by(id: @post.id + 1)
    @previous_post = Post.find_by(id: @post.id - 1)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params.merge(admin_id: session[:admin_id]))
    if post.save
      redirect_to root_path
    else
      flash[:error] = "Invalid input: must include both title and content."
      redirect_to new_post_path
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post.id)
    else
      flash[:error] = "Invalid input: must include both title and content."
      redirect_to edit_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
