class AddCategoryToVaultLots < ActiveRecord::Migration
  def change
    add_reference :vault_lots, :category, index: true
  end
end
