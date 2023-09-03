class AddPayoutRateToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :payout_rate, :decimal, precision: 10, scale: 2
  end

  def down
    remove_column :clients, :payout_rate
  end
end
