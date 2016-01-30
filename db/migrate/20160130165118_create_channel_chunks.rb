class CreateChannelChunks < ActiveRecord::Migration[5.0]
  def change
    create_table :channel_chunks do |t|
      t.string :url
      t.string :slug
      t.integer :met_start
      t.integer :met_end
      t.belongs_to :channel, index: true, foreign_key: true

      t.timestamps
    end
  end
end
