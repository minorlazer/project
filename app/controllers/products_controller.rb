

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

  def purchase
    @vault_lot = VaultLot.find(params[:id])
    @provinces_for_select = Province.provinces_for_select
  end

  def confirm
    @new_customer = Customer.create(first_name: params[:first_name],
                                    last_name: params[:last_name],
                                    street: params[:street],
                                    city: params[:city],
                                    province_id: params[:province_id],
                                    phone_number: params[:phone_number])

    if @new_customer.save
      @new_order = @new_customer.orders.build
      @new_order.status = 'pending'
      @new_order.gst = @new_customer.province.gst
      @new_order.pst = @new_customer.province.pst
      @new_order.hst = @new_customer.province.hst
      @new_order.vault_lot_id = params[:vault_lot_id].to_s
      @new_order.save

      @single_vault = VaultLot.find(params[:vault_lot_id])

      gst = @new_customer.province.gst
      pst = @new_customer.province.pst
      hst = @new_customer.province.hst

      price_gst = @single_vault.price * gst
      price_pst = @single_vault.price * pst
      price_hst = @single_vault.price * hst

      @grand_total = @single_vault.price + price_gst + price_pst + price_hst
    else
      flash[:notice] = 'An error has occurred! Please try again.'
    end
  end
  # The associated view app/views/products/index.html.slim is auto-loaded

end
