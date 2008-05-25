class Admin::ProductGroupsController < ApplicationController
  before_filter :admin_required

  def index
    @product_groups = ProductGroup.find(:all)
  end

  def new
    @product_group = ProductGroup.new
  end

  def edit
    @product_group = ProductGroup.find(params[:id])
  end

  def create
    @product_group = ProductGroup.new(params[:product_group])

    @product_group.save
    if @product_group.errors.empty?
      redirect_to admin_product_group_path(@product_group)
      flash[:notice] = "Created window config"
    else
      render :action => 'new'
    end
  end

  def update
    @product_group = ProductGroup.find(params[:id])

    if @product_group.update_attributes(params[:product_group])
      flash[:notice] = 'ProductGroup was successfully updated.'
      redirect_to admin_product_group_path(@product_group)
    else
      render :action => 'edit'
    end
  end

  def show
    @product_group = ProductGroup.find(params[:id])
  end

  def destroy
    @product_group = ProductGroup.find(params[:id])
    if @product_group.products.empty?
      @product_group.destroy
      redirect_to(admin_product_groups_url)
    else
      flash[:error] = 'There are products assigned to this group!'
      redirect_to admin_product_group_path(@product_group)
    end
  end
end
