class Admin::GlassColorsController < ApplicationController
  before_filter :admin_required

  def index
    @glass_colors = GlassColor.find(:all)
  end

  def new
    @glass_color = GlassColor.new
  end

  def create
    @glass_color = GlassColor.new(params[:glass_color])
    if @glass_color.save
      flash[:notice] = 'Glass color was successfully created.'
      redirect_to admin_glass_color_path(@glass_color)
    else
      render :action => 'new'
    end
  end

  def edit
    @glass_color = GlassColor.find(params[:id])
  end

  def update
    @glass_color = GlassColor.find(params[:id])
    if @glass_color.update_attributes(params[:glass_color])
      flash[:notice] = 'Glass color was successfully updated.'
      redirect_to admin_glass_color_path(@glass_color)
    else
      render :action => 'edit'
    end
  end

  def show
    @glass_color = GlassColor.find(params[:id])
  end

  def destroy
    @glass_color = GlassColor.find(params[:id])
    @glass_color.destroy
    redirect_to admin_glass_colors_path
  end

end
