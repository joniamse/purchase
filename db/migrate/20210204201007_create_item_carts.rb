class CreateItemCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :item_carts do |t|
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end
  end
end
