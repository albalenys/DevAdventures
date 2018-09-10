# frozen_string_literal: true

# Admin has necessary log in info to add and maintain posts/projects.
class Admin < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :posts
  has_many :projects
end
