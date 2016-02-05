class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media do |t|
      t.text :url, null: false
      t.string :title, null: false
      t.string :slug, null: false
      t.text :caption
      t.string :alt_text
      t.text :description
      t.belongs_to :mission, null: false, index: true, foreign_key: true

      t.timestamps
      t.index :slug, unique: true
    end
  end
end
