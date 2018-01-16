class AddContentToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :content, :string
  end
end
