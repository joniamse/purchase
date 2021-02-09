class CreateComponents < ActiveRecord::Migration[6.1]
  def change
    create_table :components do |t|
      t.string :model
      t.string :category
      t.string :serial_number
      t.boolean :rgb

      t.timestamps
    end
  end
end
