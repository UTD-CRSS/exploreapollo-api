class CreateAudioCacheItems < ActiveRecord::Migration[5.0]
  def change
    create_table :audio_cache_items do |t|
      t.integer :channels, array: true, default: []
      t.integer :met_start
      t.integer :met_end
      t.string :format
      t.string :url

      t.timestamps
    end
  end
end
