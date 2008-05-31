class Seller::ProductConfigsController < ApplicationController
  before_filter :seller_required, :get_order

  def get_order
    @order = Order.find(params[:order_id]) unless params[:order_id].nil?
  end

  def index
    @product_configs = @order.product_configs.find(:all)
  end

  def new
    @product_config = ProductConfig.new
  end

  def edit
    @product_config = @order.product_configs.find(params[:id])
  end

  def create
    @product_config = ProductConfig.new(params[:product_config])
    @product_config.save
    @item = OrderItem.new(:item => @product_config, :order => @order)
    @item.save

    if @product_config.errors.empty?
      redirect_to seller_order_path(@order)
      flash[:notice] = "Created product config"
    else
      flash[:error] = "Couldn't save this product config"
      render :action => 'new'
    end
  end

  def update
    @product_config = @order.product_configs.find(params[:id])

    if @product_config.update_attributes(params[:product_config])
      flash[:notice] = 'ProductConfig was successfully updated.'
      redirect_to seller_order_path(@order)
    else
      render :action => 'edit'
    end
  end

  def show
    @product_config = @order.product_configs.find(params[:id])
  end

  def destroy
    @product_config = @order.product_configs.find(params[:id])
    @product_config.destroy
    redirect_to(:back)
  end
end
