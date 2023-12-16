class FixDatabaseConsistency < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :admin, false
  end
end
