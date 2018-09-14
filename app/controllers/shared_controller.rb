# frozen_string_literal: true

class SharedController < ApplicationController
  def index
    ordered_projects = Project.all.order(created_at: :desc)
    @projects = ordered_projects.paginate(page: params[:page], per_page: 4)
    @posts_by_month = Post.public_posts.order(created_at: :desc).sort_by_month
  end

  def search
    @query = params[:q][:title_cont]
    project_query = @project_query.result(distinct: true)
    @projects = project_query.paginate(page: params[:page], per_page: 4)
    post_query = @post_query.result(distinct: true).where(private: false)
    @posts_by_month = post_query.order(created_at: :desc).sort_by_month
  end
end
