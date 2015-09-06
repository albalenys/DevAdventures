module ApplicationHelper
  def logged_in?
    session[:admin_id]
  end

  def authorize_user
    redirect_to root_path if !logged_in?
  end
end
