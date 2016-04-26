class Project < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :admin
  has_many :tags, as: :taggable

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
