class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.string :slug, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.belongs_to :mission, index: true, foreign_key: true

      t.timestamps
      t.index :slug, unique: true
    end
  end
end
