class ChangeUpcToString < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :upc, :string
  end
end
