class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues, id: :uuid do |t|
      t.uuid :project_id, null: false

      t.string :summary, null: false
      t.text :description, null: false, default: ''

      t.timestamps null: false
    end

    add_foreign_key :issues, :projects, on_delete: :cascade
  end
end
