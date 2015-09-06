class AdminController < ApplicationController
  def auth
    @admin = Admin.new
  end

  # def login
  #   admin = Admin.find_by(username: params[:admin][:username])
  #   if admin && admin.authenticate(params[:admin][:password])
  #     session[:admin] = admin
  #     redirect_to "/"
  #   else
  #     "error"
  #   end
  # end
end