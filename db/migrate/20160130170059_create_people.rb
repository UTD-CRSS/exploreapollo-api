class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.string :photo_url
      t.string :slug, null: false

      t.timestamps
      t.index :slug, unique: true
    end
  end
end
