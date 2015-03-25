class ProductsController < ApplicationController
  def index
    @vault_lots = VaultLot.all
  end
  # The associated view app/views/products/index.html.erb is auto-loaded

end
