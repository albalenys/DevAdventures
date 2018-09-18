# frozen_string_literal: true

class AdminController < ApplicationController
  def auth
    @admin = Admin.new
    @modal_content_partial = 'admin/form';
    @modal_heading = 'Log In';
    render 'shared/_modal'
  end

  def login
    admin = Admin.find_by(username: params[:admin][:username])
    if admin&.authenticate(params[:admin][:password])
      session[:admin_id] = admin.id
      redirect_to root_path
    else
      flash[:error] = 'You do not have authorized admin access.'
      redirect_to admin_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end
end
