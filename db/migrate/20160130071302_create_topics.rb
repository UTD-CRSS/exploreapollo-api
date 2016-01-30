class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :slug
      t.string :display_name

      t.timestamps
    end
  end
end
