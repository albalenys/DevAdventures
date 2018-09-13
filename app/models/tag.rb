# frozen_string_literal: false

# Tags or categories for better search function in blog posts/projects.
class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings, source: :taggable, source_type: 'Post'
  has_many :projects, through: :taggings, source: :taggable, source_type: 'Project'
end
