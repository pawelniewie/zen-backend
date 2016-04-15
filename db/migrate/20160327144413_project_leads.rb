class ProjectLeads < ActiveRecord::Migration
  def change
  	execute <<-SQL
ALTER TABLE projects ADD lead text not null references basic_auth.users (email) 
	on delete restrict on update cascade;
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
drop policy if exists projects_eigenedit on projects;
create policy projects_eigenedit on projects
  using (true)
  with check (
    lead = basic_auth.current_email()
  );
  	SQL
  end
end
