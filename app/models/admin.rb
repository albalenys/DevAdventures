# frozen_string_literal: true

class Admin < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :posts
  has_many :projects
end
