class CreateTranscribers < ActiveRecord::Migration[6.1]
  def change
    create_table :transcribers do |t|
      t.string :transcriberUrl, null: false, unique: true
      t.references :multi_channel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
