class CreateTotes < ActiveRecord::Migration[5.1]
  def change
    create_table :totes do |t|
      t.belongs_to :cart, index: true, foreign_key: true
      t.belongs_to :product, index: true, foreign_key: true
      t.string :position

      t.timestamps
    end
    
  end
end
