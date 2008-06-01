class Seller::OrdersController < ApplicationController
       before_filter :seller_required

  def index
    @curent_user_orders = []
    if current_user.kind_of?(Admin) || current_user.kind_of?(ProductionManager)
      flash[:error] = "You don't have any orders assigned !"
    else
      @curent_user_orders = Order.search(params[:search], params[:page], current_user)
    end
  end

  def requested_index
    @requested_orders = []
    if current_user.kind_of?(Seller)
      @requested_orders = Order.find_requested.paginate :page => params[:page]
    end
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params[:order])

    @order.save
    if @order.errors.empty?
      redirect_to seller_order_path(@order)
      flash[:notice] = "Created new order"
    else
      render :action => 'new'
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.order_items.each do |item|
      item.quantity = params[:order_item][:quantity][item.id.to_s].to_i if params[:order_item][:quantity].has_key?(item.id.to_s)
      item.save
    end
    if @order.update_attributes(params[:order])
      flash[:notice] = 'Order was successfully updated.'
      redirect_to seller_order_path(@order)
    else
      render :action => 'edit'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order.order_items.each do |order_item|
      order_item.destroy
    end
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to(seller_orders_url)
  end

end
