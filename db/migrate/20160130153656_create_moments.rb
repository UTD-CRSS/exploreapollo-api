class CreateMoments < ActiveRecord::Migration[5.0]
  def change
    create_table :moments do |t|
      t.string :slug, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :met_start, null: false
      t.integer :met_end, null: false

      t.timestamps
    end
  end
end
