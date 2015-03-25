class ProductsController < ApplicationController
  def index
    @vault_lots = VaultLot.all
    @vault_name = VaultLot.status("")
  end


  # The associated view app/views/products/index.html.erb is auto-loaded

end
