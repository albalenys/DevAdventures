# frozen_string_literal: true

class SharedController < ApplicationController
  def index
    ordered_projects = Project.all.order(created_at: :desc)
    @projects = ordered_projects.paginate(page: params[:page], per_page: 4)
    @posts_by_month = Post.public_posts.order(created_at: :desc).sort_by_month
  end

  def search
    @query = params[:q][:title_cont]
    @projects = @project_query.result(distinct: true)
    @posts = @post_query.result(distinct: true).where(private: false)
  end
end
