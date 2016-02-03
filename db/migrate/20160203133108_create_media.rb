class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media do |t|
      t.string :title
      t.text :url

      t.timestamps
    end
  end
end
