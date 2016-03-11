class AddIndexToForeignKeys < ActiveRecord::Migration
  def change
    add_index :posts, :private
    add_index :posts, :admin_id
    add_index :projects, :admin_id
    add_index :resources, :post_id
  end
end
