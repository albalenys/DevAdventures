class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title, null: false
      t.string :url, null: false

      t.belongs_to :post

      t.timestamps null: false
    end
  end
end