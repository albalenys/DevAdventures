class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :admin
  has_many :resources
  has_many :tags, as: :taggable

  def self.sort_by_month
    self.all.group_by { |post| post.created_at.beginning_of_month }
  end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def next_post(direction)
    post_index = Post.public_posts.index(self)
    if direction == "up"
      index = post_index + 1
    else
      return nil if post_index == 0
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
end
