class AddOrderToMomentStoryJoin < ActiveRecord::Migration[5.0]
  def change
  	add_column :moments_stories, :order, :integer
  end
end
