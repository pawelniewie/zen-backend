class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects, id: :uuid do |t|
      t.string :key, null: false
      t.string :name, null: false
      t.text :description, null: false, default: ''

      t.timestamps null: false

      t.index :key, unique: true
    end
  end
end
