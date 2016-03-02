class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :admin
  has_many :resources

  def self.sort_by_month
    self.all.group_by { |post| post.created_at.beginning_of_month }
  end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def next_post(direction)
    public_posts = Post.where(private: false)
    if direction == "up"
      index = public_posts.index(self) + 1
    else
      return nil if public_posts.index(self) == 0
      index = public_posts.index(self) - 1
    end
    public_posts[index]
  end
end
