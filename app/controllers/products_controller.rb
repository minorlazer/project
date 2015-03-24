class ProductsController < ApplicationController
  def index
    @vault_lots = VaultLot.all
  end

=begin
  def about
    @about = About.first
  end
=end

=begin
  def contact
    @contact = Contact.first
  end
=end
  # The associated view app/views/products/index.html.erb is auto-loaded

end
