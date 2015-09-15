class WelcomeController < ApplicationController
  def index
    @recent_posts = Post.all.last(2)
  end

  def search
    @query = params[:search][0]
    @posts = Post.search(params[:search][0]).order("created_at DESC")
    @projects = Project.search(params[:search][0]).order("created_at DESC")
  end
end
