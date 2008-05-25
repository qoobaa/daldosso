class Admin::ProductsController < ApplicationController
  before_filter :admin_required

  def index
    @products = Product.find(:all)
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    @product.save
    if @product.errors.empty?
      redirect_to admin_product_path(@product)
      flash[:notice] = "Created product"
    else
      render :action => 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      flash[:notice] = 'Product was successfully updated.'
      redirect_to admin_product_path(@product)
    else
      render :action => 'edit'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.product_configs.empty?
      @product.destroy
      redirect_to(admin_products_url)
    else
      flash[:error] = 'There are products configs with this product!'
      redirect_to admin_product_path(@product)
    end
  end
end