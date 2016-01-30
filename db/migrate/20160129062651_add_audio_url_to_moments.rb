class AddAudioUrlToMoments < ActiveRecord::Migration[5.0]
  def change
    add_column :moments, :audio_url, :string
  end
end
