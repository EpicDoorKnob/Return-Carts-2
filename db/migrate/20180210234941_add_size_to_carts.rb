class AddSizeToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :size, :integer
  end
end
