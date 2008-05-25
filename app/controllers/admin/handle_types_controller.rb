class Admin::HandleTypesController < ApplicationController
  before_filter :admin_required

  def index
    @handle_types = HandleType.find(:all)
  end

  def new
    @handle_type = HandleType.new
  end

  def create
    @handle_type = HandleType.new(params[:handle_type])
    if @handle_type.save
      flash[:notice] = 'Handle type was successfully created.'
      redirect_to admin_handle_type_path(@handle_type)
    else
      render :action => 'new'
    end
  end

  def edit
    @handle_type = HandleType.find(params[:id])
  end

  def update
    @handle_type = HandleType.find(params[:id])
    if @handle_type.update_attributes(params[:handle_type])
      flash[:notice] = 'Handle type was successfully updated.'
      redirect_to admin_handle_type_path(@handle_type)
    else
      render :action => 'edit'
    end
  end

  def show
    @handle_type = HandleType.find(params[:id])
  end

  def destroy
    @handle_type = HandleType.find(params[:id])
    @handle_type.destroy
    redirect_to admin_handle_types_path
  end

end
