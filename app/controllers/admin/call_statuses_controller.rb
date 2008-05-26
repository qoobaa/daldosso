class Admin::CallStatusesController < ApplicationController
  before_filter :admin_required

  def index
    @call_statuses = CallStatus.find(:all)
  end

  def new
    @call_status = CallStatus.new
  end

  def edit
    @call_status = CallStatus.find(params[:id])
  end

  def create
    @call_status = CallStatus.new(params[:call_status])

    @call_status.save
    if @call_status.errors.empty?
      redirect_to admin_call_status_path(@call_status)
      flash[:notice] = "Created call status"
    else
      render :action => 'new'
    end
  end

  def update
    @call_status = CallStatus.find(params[:id])

    if @call_status.update_attributes(params[:call_status])
      flash[:notice] = 'CallStatus was successfully updated.'
      redirect_to admin_call_status_path(@call_status)
    else
      render :action => 'edit'
    end
  end

  def show
    @call_status = CallStatus.find(params[:id])
  end

  def destroy
    @call_status = CallStatus.find(params[:id])
    if @call_status.calls.empty?
      @call_status.destroy
      redirect_to(admin_call_statuses_url)
    else
      flash[:error] = 'There are some calls assigned to this status!'
      redirect_to admin_call_status_path(@call_status)
    end
  end
end
