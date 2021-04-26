class AddReferencesToMultiChannels < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :multi_channels, :channels, column: :channel_name, primary_key: :slug
  end
end
