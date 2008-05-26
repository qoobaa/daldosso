class Admin::WindowConfigsController < ApplicationController
  before_filter :admin_required

  def index
    @window_configs = WindowConfig.find(:all)
  end

  def new
    @window_config = WindowConfig.new
  end

  def edit
    @window_config = WindowConfig.find(params[:id])
  end

  def create
    @window_config = WindowConfig.new(params[:window_config])

    @window_config.save
    if @window_config.errors.empty?
      redirect_to admin_window_config_path(@window_config)
      flash[:notice] = "Created window config"
    else
      render :action => 'new'
    end
  end

  def update
    @window_config = WindowConfig.find(params[:id])

    if @window_config.update_attributes(params[:window_config])
      flash[:notice] = 'WindowConfig was successfully updated.'
      redirect_to admin_window_config_path(@window_config)
    else
      render :action => 'edit'
    end
  end

  def show
    @window_config = WindowConfig.find(params[:id])
  end

  def destroy
    @window_config = WindowConfig.find(params[:id])
    @window_config.destroy
    redirect_to(admin_window_configs_url)
  end
end
