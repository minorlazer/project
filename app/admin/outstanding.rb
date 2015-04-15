ActiveAdmin.register_page 'Outstanding Orders' do
  content do
    @pending_customers = Order.where("status LIKE 'pending'")
    render partial: 'pages/outstanding_orders',
           locals: {pending_customers: @pending_customers}
  end
end