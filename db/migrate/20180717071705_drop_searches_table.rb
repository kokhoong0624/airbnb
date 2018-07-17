class DropSearchesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :searches
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
