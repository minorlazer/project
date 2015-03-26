class AddVaultLotToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :vault_lot, index: true
  end
end
