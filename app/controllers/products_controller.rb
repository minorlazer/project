

class ProductsController < ApplicationController
  def index
    @vault_lots = VaultLot.all.page(params[:page]).per(4).order('price')
    @vault_name = VaultLot.starts_with(params[:keywords])
    @categories_for_select = Category.categories_for_select # [['All', 0], ...]
  end

  def search
    if params[:commit] == 'Search'
      @vault_name = VaultLot.search(params)
    else
      @vault_name = VaultLot.filter(params)
    end
  end

  def show
    @vault_lot = VaultLot.find(params[:id])

    if session[:previous_vault_id]
      @previous_vault = VaultLot.find(session[:previous_vault_id])
    end
    session[:previous_vault_id] = params[:id]
  end

  def purchase
    @vault_lot = VaultLot.find(params[:id])
    @provinces_for_select = Province.provinces_for_select
  end

  def confirm
    @new_customer = Customer.new_customer(params)

    if @new_customer.save
      Order.new_order(@new_customer, params[:vault_lot_id])

      @single_vault = VaultLot.find(params[:vault_lot_id])

      @grand_total = Order.total(@new_customer, @single_vault)
    else
      flash[:notice] = 'An error has occurred! Please try again.'
    end
  end
  # The associated view app/views/products/index.html.slim is auto-loaded
end
