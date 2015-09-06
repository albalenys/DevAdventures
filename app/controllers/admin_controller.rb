class AdminController < ApplicationController
  def auth
    @admin = Admin.new
  end

  def show
  end

  def login
    admin = Admin.find_by(username: params[:admin][:username])
    if admin && admin.authenticate(params[:admin][:password])
      session[:admin_id] = admin.id
      redirect_to root_path
    else
      flash[:error] = "You are not authorized to have admin access."
      redirect_to admin_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end
end