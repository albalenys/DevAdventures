class PostsController < ApplicationController
  before_filter :authorize_user, except: [:show]
  before_filter :find_post, except: [:new, :create, :private]

  def private
    private_posts = Post.where(private: true)
    @posts_by_month = private_posts.order(created_at: :desc).sort_by_month
  end

  def show
    unless @post.private
      @next_post = @post.next_post("up")
      @previous_post = @post.next_post("down")
    end
    authorize_user if @post.private
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params.merge(admin_id: session[:admin_id]))
    if post.save
      redirect_to "/#blogs"
    else
      flash[:error] = "Invalid input: must include both title and content."
      redirect_to new_post_path
    end
  end

  def destroy
    @post.destroy
    redirect_to "/#blogs"
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
    params.require(:post).permit(:title, :content, :private)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
