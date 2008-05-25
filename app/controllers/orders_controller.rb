class OrdersController < ApplicationController

  def index
     @isCustomer = false
    if (current_user!=nil && current_user.type==Customer)
      @isCustomer = true
      @customer = Customer.find(current_user.id)
      @orders = @customer.orders
    else
      @orders = []
      redirect_to login_url
    end
  end

  def new
    @order = Order.new
    unless current_user
      flash[:notice] = "You need to be logged in to create order"
      redirect_to orders_url
    end
  end

  def create
    @order = Order.new(params[:order])
    configs = params[:winconf]
    quantities = params[:quantities]
    configs[:ids].each do |id|
      o = OrderItem.new
      o.quantity = quantities[:ids][id]
      o.item = WindowConfig.find(id)
      @order.order_items << o
    end
    @order.order_status = OrderStatus.find(:first)
    @order.customer = current_user
    isSaved = @order.save if current_user
    if (isSaved)
      redirect_to @order
    else
      render :action => 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.order_items.each{|item| item.destroy}
    flash[:msg] = "Succesfully deleted"
    flash[:msg] = "Error" unless @order.destroy
    redirect_to orders_path
  end

end
