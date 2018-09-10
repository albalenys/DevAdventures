# frozen_string_literal: true

class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.public_posts
  end
end
