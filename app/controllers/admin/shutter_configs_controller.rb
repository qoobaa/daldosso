class Admin::ShutterConfigsController < ApplicationController
  before_filter :admin_required

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
      redirect_to admin_shutter_config_path(@shutter_config)
      flash[:notice] = "Created shutter config"
    else
      render :action => 'new'
    end
  end

  def update
    @shutter_config = ShutterConfig.find(params[:id])

    if @shutter_config.update_attributes(params[:shutter_config])
      flash[:notice] = 'ShutterConfig was successfully updated.'
      redirect_to admin_shutter_config_path(@shutter_config)
    else
      render :action => 'edit'
    end
  end

  def show
    @shutter_config = ShutterConfig.find(params[:id])
  end

  def destroy
    @shutter_config = ShutterConfig.find(params[:id])
    if @shutter_config.order_items.empty?
      @shutter_config.destroy
      redirect_to(admin_shutter_configs_url)
    else
      flash[:notice] = 'This shutter config has been assigned to some orders!'
      redirect_to admin_shutter_config_path(@shutter_config)
    end
  end
end
