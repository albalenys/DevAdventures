# frozen_string_literal: true

class SharedController < ApplicationController
  def index
    ordered_projects = Project.all.order(created_at: :desc)
    @projects = ordered_projects.paginate(page: params[:page], per_page: 4)
    @posts_by_month = Post.public_posts.order(created_at: :desc).sort_by_month
  end

  def search
    @query = params[:query]

    project_result = Project.where(title: params[:query])
    @projects = project_result.paginate(page: params[:page], per_page: 4)

    post_result = Post.where(title: params[:query], private: false)
    @posts_by_month = post_result.order(created_at: :desc).sort_by_month
  end
end
