class AddMissionToStory < ActiveRecord::Migration[6.1]
  def up
    add_column :stories, :mission_id, :integer, :default => 1
    add_foreign_key :stories, :missions
  end
  def down
  end
end