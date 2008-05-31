class Seller::ShutterConfigsController < ApplicationController
  before_filter :seller_required

  def index
    @shutter_configs = ShutterConfig.find(:all)
  end

  def new
    @shutter_config = ShutterConfig.new
  end

  def edit
    @shutter_config = ShutterConfig.find(params[:id])
  end

  def create
    @shutter_config = ShutterConfig.new(params[:shutter_config])

    @shutter_config.save
    if @shutter_config.errors.empty?
      redirect_to seller_shutter_config_path(@shutter_config)
      flash[:notice] = "Created shutter config"
    else
      render :action => 'new'
    end
  end

  def update
    @shutter_config = ShutterConfig.find(params[:id])

    if @shutter_config.update_attributes(params[:shutter_config])
      flash[:notice] = 'ShutterConfig was successfully updated.'
      redirect_to seller_shutter_config_path(@shutter_config)
    else
      render :action => 'edit'
    end
  end

  def show
    @shutter_config = ShutterConfig.find(params[:id])
  end

  def destroy
    @shutter_config = ShutterConfig.find(params[:id])
    @shutter_config.destroy
    redirect_to(:back)
  end
end
