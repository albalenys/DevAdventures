class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_filter :set_query

  def authorize_user
    redirect_to root_path if !logged_in?
  end

  def set_query
    @project_query = Project.ransack(params[:q])
    @post_query = Post.ransack(params[:q])
  end
end
