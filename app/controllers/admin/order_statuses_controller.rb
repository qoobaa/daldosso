class Admin::OrderStatusesController < ApplicationController
    before_filter :admin_required

  def index
    @order_statuses = OrderStatus.find(:all)
  end

  def new
    @order_status = OrderStatus.new
  end

  def edit
    @order_status = OrderStatus.find(params[:id])
  end

  def create
    @order_status = OrderStatus.new(params[:order_status])

    @order_status.save
    if @order_status.errors.empty?
      redirect_to admin_order_status_path(@order_status)
      flash[:notice] = "Created order status"
    else
      render :action => 'new'
    end
  end

  def update
    @order_status = OrderStatus.find(params[:id])

    if @order_status.update_attributes(params[:order_status])
      flash[:notice] = 'OrderStatus was successfully updated.'
      redirect_to admin_order_status_path(@order_status)
    else
      render :action => 'edit'
    end
  end

  def show
    @order_status = OrderStatus.find(params[:id])
  end

  def destroy
    @order_status = OrderStatus.find(params[:id])
    if @order_status.orders.empty?
      @order_status.destroy
      redirect_to(admin_order_statuses_url)
    else
      flash[:error] = 'There are some orders assigned to this status!'
      redirect_to admin_order_status_path(@order_status)
    end
  end

end
