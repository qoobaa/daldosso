class Seller::OrdersController < ApplicationController
       before_filter :seller_required

  def index
    @orders = Order.find(:all)
    @curent_user_orders = current_user.orders.find(:all)
    @requested_orders = Order.find_requested_orders
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
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to(seller_orders_url)
  end

end
