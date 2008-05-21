class Admin::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = " Order Successfully created..."
      redirect_to admin_order_url(@order)
    else
      render :action => 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
