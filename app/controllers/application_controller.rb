class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_query

  def authorize_user
    redirect_to root_path if !logged_in?
  end

  def set_query
    @q = Project.ransack(params[:q])
    @post = Post.ransack(params[:q])
  end
end
