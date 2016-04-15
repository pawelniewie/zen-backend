class Signup < ActiveRecord::Migration
  def change
  	execute <<-SQL
create or replace function
signup(email text, pass text) returns void
as $$
  insert into basic_auth.users (email, pass, role) values
    (signup.email, signup.pass, 'author');
$$ language sql;
  	SQL
  end
end
