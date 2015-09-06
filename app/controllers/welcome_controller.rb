class WelcomeController < ApplicationController
  def index
    @recent_posts = Post.all.last(2)
  end
end