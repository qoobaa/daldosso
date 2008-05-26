class Seller::EventsController < ApplicationController
  def index
    month = params[:m] || Date.today.month
    year = params[:y] || Date.today.year
    day = params[:d] || Date.today.day
    @date = "#{year}-#{month}-#{day}".to_date
    @month_events = Event.find_all_in_month(@date)
    @due_events = Event.find_due_on_day(@date)
    @added_events = Event.find_added_on_day(@date)
  end
end
