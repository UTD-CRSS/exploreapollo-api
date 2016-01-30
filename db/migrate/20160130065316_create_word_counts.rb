class CreateWordCounts < ActiveRecord::Migration[5.0]
  def change
    create_table :word_counts do |t|
      t.integer :met_start
      t.integer :met_end
      t.integer :count
      t.belongs_to :channel, index: true, foreign_key: true
    end
  end
end
