class CreateJoinTableChannelsTopics < ActiveRecord::Migration[5.0]
  def change
    create_join_table :channels, :topics do |t|
      # t.index [:channel_id, :topic_id]
      # t.index [:topic_id, :channel_id]
    end
  end
end
