class AddStoryRefToMoments < ActiveRecord::Migration[6.1]
  def change
    add_reference :moments, :story, foreign_key: true
  end
end
