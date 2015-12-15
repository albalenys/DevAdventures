class Project < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :admin

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
