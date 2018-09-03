class PostsController < ApplicationController
  before_action :authorize_user, except: [:show, :feed]
  before_action :find_post, except: [:new, :create, :private, :feed]

  def show
    if @post.private
      authorize_user
    else
      @next_post = @post.next_post("up")
      @previous_post = @post.next_post("down")
    end
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params.merge(admin_id: session[:admin_id]))

    if post.save
      params[:tags].split(",").each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        post.tags << tag
      end
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

  def private
    @posts_by_month = Post.private_posts.order(created_at: :desc).sort_by_month
  end

  def feed
    @posts = Post.public_posts.limit(50)
    respond_to do |format|
      format.rss { render layout: false }
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
