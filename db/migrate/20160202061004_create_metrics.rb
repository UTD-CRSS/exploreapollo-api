class CreateMetrics < ActiveRecord::Migration[5.0]
  def change
    create_table :metrics do |t|
      t.string :type, null: false
      t.integer :met_start, limit: 8, null: false
      t.integer :met_end, limit: 8, null: false
      t.hstore :data, null: false
      t.belongs_to :channel, index: true, foreign_key: true

      t.timestamps
      t.index :data, using: :gin
    end
  end
end
