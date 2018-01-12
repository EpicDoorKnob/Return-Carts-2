class AddSkuIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :sku_id, :string
    add_column :products, :sku_type, :string
    add_column :products, :composition_quantity, :integer
  end
end
