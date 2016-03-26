class BasicAuth < ActiveRecord::Migration
  def change
  	execute <<-SQL
  		CREATE SCHEMA IF NOT EXISTS basic_auth;
    SQL
  end
end
