class AddOrderToMoments < ActiveRecord::Migration[6.1]
  def change
    add_column :moments, :order, :int
  end
end
