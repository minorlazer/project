class CreateVaultLots < ActiveRecord::Migration
  def change
    create_table :vault_lots do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
