class CreateMultiChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :multi_channels do |t|
      t.string :operation, null: false
      t.string :audioUrl, null: false
      t.integer :block_index, null: false
      t.integer :nugget_index, null: false
      t.string :channel_name, null: false
      t.references :tape, null: false, foreign_key: true
      t.references :mission, null: false, foreign_key: true
      t.timestamps
    end
  end
end
