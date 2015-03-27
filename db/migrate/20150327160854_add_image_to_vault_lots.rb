class AddImageToVaultLots < ActiveRecord::Migration
  def change
    add_column :vault_lots, :image, :string
  end
end
