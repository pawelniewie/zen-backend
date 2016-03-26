class SetCreatedAtAndUpdatedAt < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE projects ALTER created_at SET DEFAULT now();
      ALTER TABLE projects ALTER updated_at SET DEFAULT now();
      ALTER TABLE issues ALTER created_at SET DEFAULT now();
      ALTER TABLE issues ALTER updated_at SET DEFAULT now();
    SQL
  end
end
