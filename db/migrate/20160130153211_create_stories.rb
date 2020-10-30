class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :slug, null: false
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
      t.index :slug, unique: true
    end
  end
end
