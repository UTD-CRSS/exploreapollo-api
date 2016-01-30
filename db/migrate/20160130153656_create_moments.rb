class CreateMoments < ActiveRecord::Migration[5.0]
  def change
    create_table :moments do |t|
      t.string :slug
      t.string :title
      t.text :description
      t.integer :met_start
      t.integer :met_end

      t.timestamps
    end
  end
end
