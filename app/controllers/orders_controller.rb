class OrdersController < ApplicationController

  def index
     @isCustomer = false
    if (current_user!=nil && current_user.type==Customer)
      @isCustomer = true
      @customer = Customer.find(current_user.id)
      @orders = @customer.orders
    else
      @orders = []
    end
  end

  def new
    @order = Order.new
    @customer = current_user if current_user
    unless @customer
      flash[:notice] = "You need to be logged in to create order"
      redirect_to orders_url
    end
  end

  def create
    @order = Order.new(params[:order])
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    flash[:msg] = "Succesfully deleted"
    flash[:msg] = "Error" unless @order.destroy
    redirect_to orders_path
  end

end
