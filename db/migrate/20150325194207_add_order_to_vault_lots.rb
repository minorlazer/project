class AddOrderToVaultLots < ActiveRecord::Migration
  def change
    add_reference :vault_lots, :order, index: true
  end
end
