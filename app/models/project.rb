# frozen_string_literal: true

# Represents coding projects in porfolio.
class Project < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :admin
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings
end
