# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authorize_user, except: %i[show feed]
  before_action :find_post, except: %i[new create private_index feed]

  def show
    if @post.private
      authorize_user
    else
      @next_post = @post.next_post('up')
      @previous_post = @post.next_post('down')
    end
  end

  def new
    @post = Post.new
    @posts_by_month = Post.public_posts.order(created_at: :desc).sort_by_month

    # Necessary for modal functionality
    @parent_element = '#posts-container';
    @modal_content_partial = 'posts/form';
    @modal_heading = 'New Post';

    respond_to do |format|
      format.js { render 'shared/modal.js.erb' }
    end
  end

  def create
    post = Post.new(post_params.merge(admin_id: session[:admin_id]))

    if post.save
      @posts_by_month = Post.public_posts.order(created_at: :desc).sort_by_month
      respond_to :js
    else
      flash[:error] = 'Invalid input: must include both title and content.'
      redirect_to new_post_path
    end
  end

  def destroy
    @post.destroy
    redirect_to '/#blogs'
  end

  def update
    if @post.update_attributes(post_params)
      respond_to :js
    else
      flash[:error] = 'Invalid input: must include both title and content.'
      redirect_to edit_post_path
    end
  end

  def edit
    @posts_by_month = Post.public_posts.order(created_at: :desc).sort_by_month
    
    # Necessary for modal functionality
    @parent_element = '#posts-container';
    @modal_content_partial = 'posts/form';
    @modal_heading = 'Edit Post';

    respond_to do |format|
      format.js { render 'shared/modal.js.erb' }
    end
  end

  def private_index
    @posts_by_month = Post.private_posts.order(created_at: :desc).sort_by_month
    @private = true;
    render '_index'
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
