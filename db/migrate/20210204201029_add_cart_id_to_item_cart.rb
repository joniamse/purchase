class AddCartIdToItemCart < ActiveRecord::Migration[6.1]
  def change
    add_reference :item_carts, :cart, null: false, foreign_key: true
  end
end
