class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :admin

  def self.sort_by_month
    self.all.group_by { |post| post.created_at.strftime("%B") }
  end
end
