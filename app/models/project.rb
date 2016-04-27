class Project < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :admin
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
