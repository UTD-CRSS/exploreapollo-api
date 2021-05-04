class CreateAudioCacheItems < ActiveRecord::Migration[5.0]
  def change
    create_table :audio_cache_items do |t|
      t.integer :channels, array: true, default: [], null: false
      t.integer :met_start, limit: 8, null: false
      t.integer :met_end, limit: 8, null: false
      t.string :format, null: false
      t.text :url, null: false

      t.timestamps
    end
  end
end
