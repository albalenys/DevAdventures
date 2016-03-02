class AdminController < ApplicationController
  before_filter :authorize_user, only: [:private]

  def private
    posts = Post.where(private: true)
    @posts_by_month = posts.order(created_at: :desc).sort_by_month
  end

  def auth
    @admin = Admin.new
  end

  def login
    admin = Admin.find_by(username: params[:admin][:username])
    if admin && admin.authenticate(params[:admin][:password])
      session[:admin_id] = admin.id
      redirect_to root_path
    else
      flash[:error] = "You do not have authorized admin access."
      redirect_to admin_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end
end
