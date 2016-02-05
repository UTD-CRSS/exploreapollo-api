class CreateMoments < ActiveRecord::Migration[5.0]
  def change
    create_table :moments do |t|
      t.string :slug, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :met_start, limit: 8, null: false
      t.integer :met_end, limit: 8, null: false

      t.timestamps
      t.index :slug, unique: true
    end
  end
end
