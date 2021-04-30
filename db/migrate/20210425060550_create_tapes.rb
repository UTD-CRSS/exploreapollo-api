class CreateTapes < ActiveRecord::Migration[6.0]
  def change
    create_table :tapes do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.integer :met_start, null: false
      t.integer :met_end, null: false
      t.integer :num_blocks
      t.integer :num_nuggets
      t.references :mission, index: true, foreign_key: true

      t.timestamps
      t.index :slug, unique: true
    end
  end
end
