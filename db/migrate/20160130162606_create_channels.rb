class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.string :slug
      t.string :title
      t.text :description
      t.belongs_to :mission, index: true, foreign_key: true

      t.timestamps
    end
  end
end
