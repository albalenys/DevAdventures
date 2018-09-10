# frozen_string_literal: true

# Represents additional links and resources used in blog posts.
class Resource < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true

  belongs_to :post
end
