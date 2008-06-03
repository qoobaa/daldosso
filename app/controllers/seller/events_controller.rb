class Seller::EventsController < ApplicationController
  before_filter :seller_required, :get_order

  def get_order
    @order = Order.find(params[:order_id]) unless params[:order_id].nil?
  end

  def get_event
    if @order.nil?
      Event.find(params[:id])
    else
      @order.events.find(params[:id])
    end

  end

  def get_events
    if @order.nil?
      Event
    else
      @order.events
    end
  end

  def index
    @events = get_events.find(:all)
    # get current date or that from params
    month = params[:m] || Date.today.month
    year = params[:y] || Date.today.year
    day = params[:d] || Date.today.day
    # build a date
    @date = "#{year}-#{month}-#{day}".to_date
    @month_events = get_events.find_all_in_month(@date)
    @due_events = get_events.find_due_on_day(@date)
    @added_events = get_events.find_added_on_day(@date)
  end

  def new
    if @order.nil?
      @event = Event.new
    elsif !@order.nil?
      @event = @order.events.new
    end
  end

  def edit
    @event = get_event
  end

  def create
    if !@order.nil?
      # if order is given, create event for it
      @event = @order.events.new(params[:event])
    else
      @event = Event.new(params[:event])
    end

    @event.save
    if @event.errors.empty?
      redirect_to_event
      @order.save if !@order.nil?
      flash[:notice] = "Created new event"
    else
      render :action => 'new'
    end
  end

  def update
    @event = get_event

    if @event.update_attributes(params[:event])
      flash[:notice] = 'Event was successfully updated.'
      redirect_to_event
    else
      render :action => 'edit'
    end
  end

  def show
    @event = get_event
  end

  def destroy
    @event = get_event
    @event.destroy
    redirect_to_events
  end

  def redirect_to_event
    if @order.nil?
      redirect_to seller_event_path(@event)
    else
      redirect_to seller_order_event_path(@order, @event)
    end
  end

  def redirect_to_events
    if @order.nil?
      redirect_to seller_events_path
    else
      redirect_to seller_order_events_path(@order)
    end
  end

end
