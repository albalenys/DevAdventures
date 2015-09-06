class Admin < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :password, presence: true
  validates_uniqueness_of :username

  has_many :posts
  has_many :projects
end
