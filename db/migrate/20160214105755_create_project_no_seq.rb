class CreateProjectNoSeq < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE SEQUENCE IF NOT EXISTS projects_no OWNED BY projects.seq;
      SELECT setval('projects_no', (SELECT count(*) + 1 FROM projects));
    SQL
  end
end
