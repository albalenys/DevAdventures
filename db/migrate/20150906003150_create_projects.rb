# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :description
      t.string :software

      t.belongs_to :admin, null: false

      t.timestamps null: false
    end
  end
end
