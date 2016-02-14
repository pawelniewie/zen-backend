class SetSeqAndNoNotNull < ActiveRecord::Migration
  def change
    change_column_null :projects, :seq, false
    change_column_null :issues, :no, false
  end
end
