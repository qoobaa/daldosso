class Seller::ProductConfigsController < ApplicationController
  before_filter :seller_required

  def index
    @product_configs = ProductConfig.find(:all)
  end

  def new
    @product_config = ProductConfig.new
  end

  def edit
    @product_config = ProductConfig.find(params[:id])
  end

  def create
    @product_config = ProductConfig.new(params[:product_config])

    @product_config.save
    if @product_config.errors.empty?
      redirect_to seller_product_config_path(@product_config)
      flash[:notice] = "Created product config"
    else
      render :action => 'new'
    end
  end

  def update
    @product_config = ProductConfig.find(params[:id])

    if @product_config.update_attributes(params[:product_config])
      flash[:notice] = 'ProductConfig was successfully updated.'
      redirect_to seller_product_config_path(@product_config)
    else
      render :action => 'edit'
    end
  end

  def show
    @product_config = ProductConfig.find(params[:id])
  end

  def destroy
    @product_config = ProductConfig.find(params[:id])
    if @product_config.order_items.empty?
      @product_config.destroy
      redirect_to(seller_product_configs_url)
    else
      flash[:notice] = 'This product config has been assigned to some orders!'
      redirect_to seller_product_config_path(@product_config)
    end
  end
end
