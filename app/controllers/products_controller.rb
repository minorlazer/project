class ProductsController < ApplicationController
  def index
    @vault_lots = VaultLot.all
    @vault_name = VaultLot.starts_with(params[:keywords])

    #@search_results = VaultLot.where("description LIKE?", "%#{params[:keywords]}%")
  end

  def search
    @vault_name = VaultLot.starts_with(params[:keywords])
  end


  # The associated view app/views/products/index.html.erb is auto-loaded

end
