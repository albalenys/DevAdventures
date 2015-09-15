module ApplicationHelper
  def logged_in?
    session[:admin_id]
  end
end
