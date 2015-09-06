module ApplicationHelper
  def logged_in?
    session[:admin_id]
  end

  def current_username
    admin = Admin.find_by(id: session[:admin_id])
    admin.username
  end
end
