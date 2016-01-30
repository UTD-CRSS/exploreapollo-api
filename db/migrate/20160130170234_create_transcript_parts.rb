class CreateTranscriptParts < ActiveRecord::Migration[5.0]
  def change
    create_table :transcript_parts do |t|
      t.text :text
      t.integer :met_start
      t.integer :met_end
      t.belongs_to :speaker, index: true, foreign_key: true
      t.belongs_to :channel, index: true, foreign_key: true

      t.timestamps
    end
  end
end
