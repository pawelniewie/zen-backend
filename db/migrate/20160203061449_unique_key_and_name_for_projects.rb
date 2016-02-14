class UniqueKeyAndNameForProjects < ActiveRecord::Migration
  def change
    add_index :projects, [:key, :name], unique: true
  end
end
