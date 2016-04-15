class PostgrestPermissions < ActiveRecord::Migration
  def change
  	execute <<-SQL
grant insert on table basic_auth.users, basic_auth.tokens to anon;
grant select on table pg_authid, basic_auth.users to anon;
grant execute on function
  login(text,text),
  request_password_reset(text),
  reset_password(text,uuid,text),
  signup(text, text)
  to anon;

--grant author to anon;
grant anon to authenticator;
grant author to authenticator;    

grant select, insert, update, delete
  on basic_auth.tokens, basic_auth.users to anon, author;

grant usage on schema public, basic_auth to anon, author;
  	SQL
  end
end
