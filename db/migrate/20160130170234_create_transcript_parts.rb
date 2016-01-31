class CreateTranscriptParts < ActiveRecord::Migration[5.0]
  def change
    create_table :transcript_parts do |t|
      t.text :text, null: false
      t.integer :met_start, null: false
      t.integer :met_end, null: false
      t.belongs_to :person, index: true, foreign_key: true
      t.belongs_to :channel, index: true, foreign_key: true

      t.timestamps
    end
  end
end
