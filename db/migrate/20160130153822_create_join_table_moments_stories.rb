class CreateJoinTableMomentsStories < ActiveRecord::Migration[5.0]
  def change
    create_join_table :moments, :stories do |t|
      t.index [:moment_id, :story_id], unique: true
      t.index [:story_id, :moment_id], unique: true
    end
  end
end
