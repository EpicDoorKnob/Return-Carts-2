class CreateRtncarts < ActiveRecord::Migration[5.1]
  def change
    create_table :rtncarts do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
