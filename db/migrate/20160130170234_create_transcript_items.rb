class CreateTranscriptItems < ActiveRecord::Migration[5.0]
  def change
    create_table :transcript_items do |t|
      t.text :text, null: false
      t.integer :met_start, limit: 8, null: false
      t.integer :met_end, limit: 8, null: false
      t.belongs_to :person, index: true, foreign_key: true
      t.belongs_to :channel, index: true, foreign_key: true

      t.timestamps
    end
  end
end
