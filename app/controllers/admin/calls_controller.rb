class Admin::CallsController < ApplicationController
  before_filter :admin_required

  def index
    @calls = Call.find(:all)
  end

  def new
    @call = Call.new
  end

  def edit
    @call = Call.find(params[:id])
  end

  def create
    @call = Call.new(params[:call])

    @call.save
    if @call.errors.empty?
      redirect_to admin_call_path(@call)
      flash[:notice] = "Created call "
    else
      render :action => 'new'
    end
  end

  def update
    @call = Call.find(params[:id])

    if @call.update_attributes(params[:call])
      flash[:notice] = 'Call was successfully updated.'
      redirect_to admin_call_path(@call)
    else
      render :action => 'edit'
    end
  end

  def show
    @call = Call.find(params[:id])
  end

  def destroy
    @call = Call.find(params[:id])
    @call.destroy
    redirect_to(admin_calls_url)
  end
end
