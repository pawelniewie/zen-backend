class CreateIssueNoRule < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE OR REPLACE FUNCTION issues_insert_row() RETURNS TRIGGER AS $sql$
        DECLARE
          sequence_name text;
        BEGIN
          IF NEW.no IS NULL THEN
            sequence_name := (SELECT seq FROM projects WHERE id=NEW.project_id);
            NEW.no := (SELECT nextval(sequence_name));
          END IF;

          RETURN NEW;
        END;
      $sql$ LANGUAGE plpgsql;

      CREATE TRIGGER issues_insert BEFORE INSERT ON issues FOR EACH ROW EXECUTE PROCEDURE issues_insert_row();
    SQL
  end
end
