class WelcomeController < ApplicationController
  def index
    @recent_posts = Post.all.order(created_at: :desc).last(2)
  end

  def search
    @query = params[:q][:title_cont]
    @projects = @q.result(distinct: true)
    @posts = @post.result(distinct: true)
  end
end
