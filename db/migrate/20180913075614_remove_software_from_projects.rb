class RemoveSoftwareFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :software, :boolean, default: false
  end
end
