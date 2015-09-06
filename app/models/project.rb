class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :software, presence: true
end
