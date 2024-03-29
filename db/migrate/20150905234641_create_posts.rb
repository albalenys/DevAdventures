# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false

      t.belongs_to :admin, null: false

      t.timestamps null: false
    end
  end
end
