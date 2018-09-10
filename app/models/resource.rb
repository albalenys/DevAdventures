# frozen_string_literal: true

class Resource < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true

  belongs_to :post
end
