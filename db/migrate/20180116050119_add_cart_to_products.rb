class AddCartToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :cart, foreign_key: true
  end
  add_index :products, [:cart_id, :created_at]
  end
end
