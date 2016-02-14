class ProjectIssueSequences < ActiveRecord::Migration
  class Project < ActiveRecord::Base
  end

  def change
    add_column :issues, :no, :integer

    add_column :projects, :seq, :text

    add_index :issues, [:project_id, :no], unique: true

    i = 0
    Project.all.each do |project|
      execute <<-SQL
        CREATE SEQUENCE IF NOT EXISTS project_no_#{i} OWNED BY projects.seq;
        UPDATE projects SET seq='project_no_#{i}' WHERE id='#{project.id}'
      SQL

      i += 1
    end
  end
end
