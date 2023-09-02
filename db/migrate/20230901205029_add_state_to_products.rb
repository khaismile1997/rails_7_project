class AddStateToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :state, :integer, default: 0
  end

  def down
    remove_column :products, :state
  end
end
