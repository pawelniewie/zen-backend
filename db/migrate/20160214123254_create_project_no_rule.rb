class CreateProjectNoRule < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE OR REPLACE FUNCTION projects_insert_row() RETURNS TRIGGER AS $sql$
        DECLARE
          sequence_name text;
          create_sequence text;
        BEGIN
          IF NEW.seq IS NULL THEN
            sequence_name := 'project_no_' || (SELECT nextval('projects_no'));
            create_sequence := 'CREATE SEQUENCE IF NOT EXISTS '
              || quote_ident(sequence_name) || ' START WITH 1';
            EXECUTE create_sequence;
            NEW.seq := sequence_name;
          END IF;

          RETURN NEW;
        END;
      $sql$ LANGUAGE plpgsql;

      CREATE TRIGGER projects_insert BEFORE INSERT ON projects FOR EACH ROW EXECUTE PROCEDURE projects_insert_row();
    SQL
  end
end
