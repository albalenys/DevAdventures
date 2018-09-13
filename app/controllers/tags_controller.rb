# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :find_tag, except: %i[new create]
  before_action :find_tag_post, except: %i[show destroy update]


  def show
    @posts = @tag.posts.public_posts
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @tag.update_attributes(tag_params)
      redirect_to post_path(params[:post_id])
    else
      flash[:error] = 'Invalid input.'
      redirect_to post_path(params[:post_id])
    end
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
