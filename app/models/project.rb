class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence:true

  belongs_to :admin
end
