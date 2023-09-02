class AddStateToBrands < ActiveRecord::Migration[7.0]
  def change
    add_column :brands, :state, :integer, default: 0
  end

  def down
    remove_column :brands, :state
  end
end
