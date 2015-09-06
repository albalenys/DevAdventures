class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params[:post]).merge(admin_id: session[:admin_id])
    if post.save
      redirect "/"
    else
      error
    end
  end
end