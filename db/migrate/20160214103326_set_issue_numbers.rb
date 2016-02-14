class SetIssueNumbers < ActiveRecord::Migration
  class Project < ActiveRecord::Base
    has_many :issues
  end

  class Issue < ActiveRecord::Base
    belongs_to :project
  end

  def change
    Issue.where('no IS NULL').each do |issue|
      sequence = issue.project.seq
      execute <<-SQL
        UPDATE issues SET no=(SELECT nextval('#{sequence}')) WHERE id='#{issue.id}'
      SQL
    end
  end
end
