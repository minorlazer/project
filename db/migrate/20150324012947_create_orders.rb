class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :gst
      t.decimal :pst
      t.decimal :hst

      t.timestamps
    end
  end
end
