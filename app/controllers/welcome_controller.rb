class WelcomeController < ApplicationController
  def index
    @posts_by_month = Post.order(created_at: :desc).sort_by_month
  end

  def search
    @query = params[:q][:title_cont]
    @projects = @q.result(distinct: true)
    @posts = @post.result(distinct: true)
  end
end
