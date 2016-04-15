class Signup2 < ActiveRecord::Migration
  def change
  	execute <<-SQL
drop function signup(text, text);
create or replace function
signup(email text, pass text) returns basic_auth.jwt_claims
	language plpgsql
as $$
declare
	_role name;
	result basic_auth.jwt_claims;
begin
  insert into basic_auth.users (email, pass, role) values
    (signup.email, signup.pass, 'author');

  select basic_auth.user_role(signup.email, signup.pass) into _role;
  select _role as role, signup.email as email into result;
  return result;
end;
$$;
  	SQL
  end
end
