class DropTablePlayers < ActiveRecord::Migration
  def up
    drop_table :players
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
