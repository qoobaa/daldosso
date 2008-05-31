class Seller::WindowConfigsController < ApplicationController
  before_filter :seller_required, :get_order

  def get_order
    @order = Order.find(params[:order_id]) unless params[:order_id].nil?
  end

  def index
    @window_configs = @order.window_configs.find(:all)
  end

  def new
    @window_config = WindowConfig.new
  end

  def edit
    @window_config = @order.window_configs.find(params[:id])
  end

  def create
    @window_config = WindowConfig.new(params[:window_config])
    @window_config.save
    @item = OrderItem.new(:item => @window_config, :order => @order)
    @item.save

    if @window_config.errors.empty?
      redirect_to seller_order_path(@order)
      flash[:notice] = "Created window config"
    else
      flash[:error] = "Couldn't save this window config"
      render :action => 'new'
    end
  end

  def update
    @window_config = @order.window_configs.find(params[:id])

    if @window_config.update_attributes(params[:window_config])
      flash[:notice] = 'WindowConfig was successfully updated.'
      redirect_to seller_order_path(@order)
    else
      render :action => 'edit'
    end
  end

  def show
    @window_config = @order.window_configs.find(params[:id])
  end

  def destroy
    @window_config = @order.window_configs.find(params[:id])
    @window_config.destroy
    redirect_to(:back)
  end
end
