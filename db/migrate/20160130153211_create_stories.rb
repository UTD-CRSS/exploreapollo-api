class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :slug
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
