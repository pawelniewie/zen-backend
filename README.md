Zen Backend
----------------
Backend part of my mini [project management tool](https://github.com/pawelniewie/zen). This is proof of concept work. Still there's a working demo available at https://usezen.it

# How to set it up

You need to have [postgrest](http://postgrest.com/) installed, `brew install postgrest` will do the trick.

Create PostgreSQL database for tests:

`createuser zen`

`createdb -O zen zen`

Configure credentials for the database in `config/application.yml`, it should look more or less like that:

```yaml
development:
  RAILS_ENV:                development
  DATABASE_URL:             postgres://zen:zen@localhost/zen
```

Migrate the database:

`rake db:migrate`

It may fail when trying to create different extensions, so run the missing bits as `postgres` user:

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
```

### Running PostgREST

`postgrest postgres://authenticator@localhost:5432/zen --anonymous anon -p 3001`