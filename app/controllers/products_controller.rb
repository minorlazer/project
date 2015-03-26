class ProductsController < ApplicationController
  def index
    @vault_lots = VaultLot.all
    @vault_name = VaultLot.starts_with(params[:keywords])
    @categories_for_select = Category.categories_for_select # [['All', 0], ...]
    #@search_results = VaultLot.where("description LIKE?", "%#{params[:keywords]}%")
  end

  def search
    #@vault_name = VaultLot.starts_with(params[:keywords])
    if params[:category_id].to_i == 0
      @vault_name = VaultLot.where('name like ?', "%#{params[:keywords]}%")
      # logger.debug "Here I AM!" + params.inspect
    else
      @vault_name = VaultLot.where('name like ? and category_id = ?',
                                   "%#{params[:keywords]}%", params[:category_id])
      # logger.debug "There I AM!" + params.inspect
    end
  end


  # The associated view app/views/products/index.html.erb is auto-loaded

end
