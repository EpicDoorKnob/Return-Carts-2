class AddActiveToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :active, :boolean
  end
end
