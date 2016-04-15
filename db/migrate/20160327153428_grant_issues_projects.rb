class GrantIssuesProjects < ActiveRecord::Migration
  def change
  	execute <<-SQL
grant select, insert, update, delete
  on table projects, issues to author;
grant usage, select on sequence projects_no to author;
  	SQL
  end
end
