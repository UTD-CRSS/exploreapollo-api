class CreateMissions < ActiveRecord::Migration[5.0]
  def change
    create_table :missions do |t|
      t.string :slug
      t.string :title
      t.timestamp :start_time

      t.timestamps
    end
  end
end
