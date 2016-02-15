class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :price, precision: 5, scale: 2
      t.integer :quantity
      t.string :picture
      t.timestamps null: false
    end
  end
end
