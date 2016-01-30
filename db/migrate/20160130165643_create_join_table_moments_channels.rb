class CreateJoinTableMomentsChannels < ActiveRecord::Migration[5.0]
  def change
    create_join_table :moments, :channels do |t|
      t.index [:moment_id, :channel_id]
      t.index [:channel_id, :moment_id]
    end
  end
end
