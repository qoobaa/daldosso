class Seller::EventsController < ApplicationController
       before_filter :seller_required
  def index
    @events = Event.find(:all)
    month = params[:m] || Date.today.month
    year = params[:y] || Date.today.year
    day = params[:d] || Date.today.day
    @date = "#{year}-#{month}-#{day}".to_date
    @month_events = Event.find_all_in_month(@date)
    @due_events = Event.find_due_on_day(@date)
    @added_events = Event.find_added_on_day(@date)
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    @event.save
    if @event.errors.empty?
      redirect_to seller_event_path(@event)
      flash[:notice] = "Created new event"
    else
      render :action => 'new'
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      flash[:notice] = 'Event was successfully updated.'
      redirect_to seller_event_path(@event)
    else
      render :action => 'edit'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to(seller_events_url)
  end

end
