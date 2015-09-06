class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :description
      t.text :software

      t.belongs_to :admin, null: false

      t.timestamps null: false
    end
  end
end
