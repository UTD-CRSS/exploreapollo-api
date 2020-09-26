class CreateMissions < ActiveRecord::Migration[5.0]
  def change
    create_table :missions do |t|
      t.string :slug, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.timestamp :start_time, null: false

      t.timestamps
      t.index :slug, unique: true
    end
  end
end
