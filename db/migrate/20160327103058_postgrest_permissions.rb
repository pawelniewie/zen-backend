class PostgrestPermissions < ActiveRecord::Migration
  def change
  	execute <<-SQL

create role anon;
create role author;
create role authenticator noinherit login;
grant anon to authenticator;
grant author to authenticator;

grant select, insert, update, delete
  on basic_auth.tokens, basic_auth.users to anon, author;

grant usage on schema public, basic_auth to anon, author;

-- anon can create new logins
grant insert on table basic_auth.users, basic_auth.tokens to anon;
grant select on table pg_authid, basic_auth.users to anon;
grant execute on function
  login(text,text),
  request_password_reset(text),
  reset_password(text,uuid,text),
  signup(text, text)
  to anon;
  	SQL
  end
end
