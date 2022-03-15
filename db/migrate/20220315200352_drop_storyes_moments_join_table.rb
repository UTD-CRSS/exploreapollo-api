class DropStoryesMomentsJoinTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :moments_stories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
