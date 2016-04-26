class Tag < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :taggable, polymorphic: true
end