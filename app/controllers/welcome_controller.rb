class WelcomeController < ApplicationController
  def index
    all_work = Post.all + Project.all
    @recent_work = all_work.sort_by{ |work| work.created_at }.reverse.first(2)
    #unable to use active record, no associations between posts and projects.
  end

  def search
    @query = params[:q][:title_cont]
    @projects = @q.result(distinct: true)
    @posts = @post.result(distinct: true)
  end
end
