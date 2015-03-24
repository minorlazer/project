class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.integer :phone_number

      t.timestamps
    end
  end
end
