# frozen_string_literal: true

module ApplicationHelper
  def logged_in?
    session[:admin_id]
  end

  def timestamp(obj)
    obj.created_at.strftime('%b. %d %Y')
  end
end
