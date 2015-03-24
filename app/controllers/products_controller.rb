class ProductsController < ApplicationController
  def index
    @vault_lots = VaultLot.all
  end

  def about
    @about = About.first
  end

  def contact
    @contact = Contact.first
  end
  # The associated view app/views/products/index.html.erb is auto-loaded

end
