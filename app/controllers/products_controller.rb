

class ProductsController < ApplicationController
  def index
    @vault_lots = VaultLot.all.page(params[:page]).per(4).order('price')
    @vault_name = VaultLot.starts_with(params[:keywords])
    @categories_for_select = Category.categories_for_select # [['All', 0], ...]

  end

  def search
    if params[:commit] == "Search"
      if params[:category_id].to_i == 0
        @vault_name = VaultLot.where('name like ?', "%#{params[:keywords]}%")
      else
        @vault_name = VaultLot.where('name like ? and category_id = ?',
                                     "%#{params[:keywords]}%", params[:category_id])
      end
    else
      if params[:filter] == "On Sale"
        @vault_name = VaultLot.where('price like ?', "%.5%")
      else
        @vault_name = VaultLot.where(:updated_at => 3.days.ago..Time.now)
      end
    end


  end

  def show
    @vault_lot = VaultLot.find(params[:id])

    if session[:previous_vault_id]
      @previous_vault = VaultLot.find(session[:previous_vault_id])
    end
    session[:previous_vault_id] = params[:id]
  end

  # The associated view app/views/products/index.html.erb is auto-loaded

end
