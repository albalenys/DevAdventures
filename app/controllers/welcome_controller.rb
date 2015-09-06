class WelcomeController < ApplicationController
  def index
    @recent_posts = Post.all.limit(2)
  end
end