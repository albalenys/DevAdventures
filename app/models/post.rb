class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :admin
  has_many :resources

  def self.sort_by_month
    self.all.group_by { |post| post.created_at.strftime("%B") }
  end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
