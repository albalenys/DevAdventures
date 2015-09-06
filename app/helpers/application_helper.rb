module ApplicationHelper
  def logged_in?
    session[:admin]
  end
end
