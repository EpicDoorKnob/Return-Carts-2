class AddQtyToTotes < ActiveRecord::Migration[5.1]
  def change
    add_column :totes, :qty, :integer
  end
end
