class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.string :name, null: false

     	t.belongs_to :taggable, polymorphic: true, index: true, null: false

     	t.timestamps null: false
    end
  end
end
