class AddIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :private
  end
end
