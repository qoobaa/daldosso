class Admin::ShutterTypesController < ApplicationController
  before_filter :admin_required

  def index
    @shutter_types = ShutterType.find(:all)
  end

  def new
    @shutter_type = ShutterType.new
  end

  def edit
    @shutter_type = ShutterType.find(params[:id])
  end

  def create
    @shutter_type = ShutterType.new(params[:shutter_type])

    @shutter_type.save
    if @shutter_type.errors.empty?
      redirect_to admin_shutter_type_path(@shutter_type)
      flash[:notice] = "Created shutter type"
    else
      render :action => 'new'
    end
  end

  def update
    @shutter_type = ShutterType.find(params[:id])

    if @shutter_type.update_attributes(params[:shutter_type])
      flash[:notice] = 'ShutterType was successfully updated.'
      redirect_to admin_shutter_type_path(@shutter_type)
    else
      render :action => 'edit'
    end
  end

  def show
    @shutter_type = ShutterType.find(params[:id])
  end

  def destroy
    @shutter_type = ShutterType.find(params[:id])
    if @shutter_type.shutter_configs.empty?
      @shutter_type.destroy
      redirect_to(admin_shutter_types_url)
    else
      flash[:notice] = 'This shutter type has been assigned to some shutter configs!'
      redirect_to admin_shutter_type_path(@shutter_type)
    end
  end
end
