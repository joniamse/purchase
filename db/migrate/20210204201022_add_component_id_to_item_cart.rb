class AddComponentIdToItemCart < ActiveRecord::Migration[6.1]
  def change
    add_reference :item_carts, :component, null: false, foreign_key: true
  end
end
