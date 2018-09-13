# frozen_string_literal: true
require 'pry'

class TagsController < ApplicationController
  before_action :find_tag, except: %i[new create]
  before_action :find_tag_post, except: %i[show destroy]


  def show
    @posts = @tag.posts.public_posts
  end

  def new
    @tag = Tag.new
    respond_to do |format|
      format.js
    end
  end

  def create
    tag = Tag.find_or_create_by(name: params[:tag][:name])
    unless @post.tags << tag
      flash[:error] = 'Invalid input: must include both title and url.'
    end
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @tag.destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def find_tag_post
    @post = Post.find(params[:post_id])
  end
end
