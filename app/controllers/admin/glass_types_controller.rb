class Admin::GlassTypesController < ApplicationController

  def index
    @glass_types = GlassType.find(:all)
  end

  def new
    @glass_type = GlassType.new
  end

  def create
    @glass_type = GlassType.new(params[:glass_type])
    if @glass_type.save
      flash[:notice] = 'Glass type was successfully created.'
      redirect_to admin_glass_type_path(@glass_type)
    else
      render :action => 'new'
    end
  end

  def edit
    @glass_type = GlassType.find(params[:id])
  end

  def update
    @glass_type = GlassType.find(params[:id])
    if @glass_type.update_attributes(params[:glass_type])
      flash[:notice] = 'Glass type was successfully updated.'
      redirect_to admin_glass_type_path(@glass_type)
    else
      render :action => 'edit'
    end
  end

  def show
    @glass_type = GlassType.find(params[:id])
  end

  def destroy
    @glass_type = GlassType.find(params[:id])
    @glass_type.destroy
    redirect_to admin_glass_types_path
  end

end
