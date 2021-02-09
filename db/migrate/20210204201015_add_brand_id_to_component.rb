class AddBrandIdToComponent < ActiveRecord::Migration[6.1]
  def change
    add_reference :components, :brand, null: false, foreign_key: true
  end
end
