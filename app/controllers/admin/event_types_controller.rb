class Admin::EventTypesController < ApplicationController
     before_filter :admin_required
  def index
    @event_types = EventType.find(:all)
  end

  def new
    @event_type = EventType.new
  end

  def edit
    @event_type = EventType.find(params[:id])
  end

  def create
    @event_type = EventType.new(params[:event_type])

    @event_type.save
    if @event_type.errors.empty?
      redirect_to admin_event_type_path(@event_type)
      flash[:notice] = "Created new event type"
    else
      render :action => 'new'
    end
  end

  def update
    @event_type = EventType.find(params[:id])

    if @event_type.update_attributes(params[:event_type])
      flash[:notice] = 'Event Type was successfully updated.'
      redirect_to admin_event_type_path(@event_type)
    else
      render :action => 'edit'
    end
  end

  def show
    @event_type = EventType.find(params[:id])
  end

  def destroy
    @event_type = EventType.find(params[:id])
    if @event_type.events.empty?
      @event_type.destroy
      redirect_to(admin_event_types_url)
    else
      flash[:error] = "There are #{@event_type.events.size} events assigned to this event type!"
      redirect_to admin_event_type_path(@event_type)
    end
  end

end
