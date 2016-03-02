class SharedController < ApplicationController
  def index
    projects = Project.all.order(created_at: :desc)
    @projects = projects.paginate(:page => params[:page], :per_page => 4)
    public_posts = Post.where(private: false)
    @posts_by_month = public_posts.order(created_at: :desc).sort_by_month
  end

  def search
    @query = params[:q][:title_cont]
    @projects = @q.result(distinct: true)
    @posts = @post.result(distinct: true)
  end
end
