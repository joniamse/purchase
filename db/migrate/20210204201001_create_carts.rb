class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string :user_name
      t.integer :user_id
      t.date :bill_date

      t.timestamps
    end
  end
end
