# frozen_string_literal: true

# Represents blog posts. Can be private or public.
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :admin
  has_many :resources
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  def self.sort_by_month
    all.group_by { |post| post.created_at.beginning_of_month }
  end

  def next_post(direction)
    post_index = Post.public_posts.index(self)
    if direction == 'up'
      index = post_index + 1
    else
      return nil if post_index.zero?
      
      index = post_index - 1
    end
    Post.public_posts[index]
  end

  def self.private_posts
    Post.where(private: true)
  end

  def self.public_posts
    Post.where(private: false)
  end

  def self.search(query)
    where('title like ?', "%#{query}%").public_posts
  end
end
