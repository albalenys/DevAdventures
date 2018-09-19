# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  def authorize_user
    redirect_to root_path unless logged_in?
  end
end
