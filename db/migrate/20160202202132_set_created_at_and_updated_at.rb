class SetCreatedAtAndUpdatedAt < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE projects ALTER created_at SET DEFAULT CURRENT_TIMESTAMP;
      ALTER TABLE projects ALTER updated_at SET DEFAULT CURRENT_TIMESTAMP;
      ALTER TABLE issues ALTER created_at SET DEFAULT CURRENT_TIMESTAMP;
      ALTER TABLE issues ALTER updated_at SET DEFAULT CURRENT_TIMESTAMP;
    SQL
  end
end
