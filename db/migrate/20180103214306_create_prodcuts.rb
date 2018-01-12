class CreateProdcuts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :sku
      t.integer :upc
      t.string :customer
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
