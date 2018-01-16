class AddTitleToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :title, :string
  end
end
