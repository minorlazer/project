class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :vault_lot

  def self.new_order(new_customer, vault_id)
    new_order = new_customer.orders.build
    new_order.assign_attributes(status: 'pending',
                                gst: new_customer.province.gst,
                                pst: new_customer.province.pst,
                                hst: new_customer.province.hst,
                                vault_lot_id: vault_id.to_s)
    new_order.save
  end

  def self.total(new_customer, single_vault)
    grand_total = single_vault.price + self.taxes(new_customer, single_vault)
    grand_total
  end

  def self.taxes(new_customer, single_vault)
    taxes = (single_vault.price * new_customer.province.gst) +
            (single_vault.price * new_customer.province.pst) +
            (single_vault.price * new_customer.province.hst)
    taxes
  end
end
