class CreateSpeakers < ActiveRecord::Migration[5.0]
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :title
      t.string :photo_url

      t.timestamps
    end
  end
end
