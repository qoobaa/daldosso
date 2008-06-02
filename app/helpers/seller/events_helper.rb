module Seller::EventsHelper

  def link_to_date(str, date)
    #link_to(str, { :d => date.day, :y => date.year, :m => date.month })
    link_to(str, "events?d=#{date.day}&m=#{date.month}&y=#{date.year}")
  end

  def month_name(date)
    Date::MONTHNAMES[date.month]
  end

  # generates calendar with given date for given events.
  def events_calendar(date, events)
    calendar :month => date.month,
             :year => date.year,
             :first_day_of_week => 1,
             :previous_month_text => link_to_date('&lt;', date << 1),
             :next_month_text => link_to_date('&gt;', date >> 1) do |d|

      css_class = ''

      # change to 'hasEvent' class if day has an event
      events.each { |e| css_class = 'hasEvent' if e.added_date.to_date == d || e.due_date.to_date == d }

      # add 'activeDay' class if day is the current day
      css_class += ' activeDay' if date == d

      # generate link for specific day
      [link_to_date(d.day, d), { :class => css_class }]
    end
  end

  # generates link for event(s) under different conditions
  def event_link(str, action, event = nil, order = nil)
    link = "#{event.id}/edit" if action == 'edit'
    link = "events/#{event.id}" if action == 'show' || action == 'delete'
    link = "events/new" if action == 'new'
    link = seller_order_events_path(order) if !order.nil? && action == 'index'
    link = seller_events_path if order.nil? && action == 'index'
    confirm = { 'delete' => "Are you sure?", 'show' => false, 'edit' => false, 'new' => false, 'index' => false}
    method = { 'delete' => :delete, 'show' => :get, 'edit' => :get, 'new' => :get, 'index' => :get}
    link_to str, link, :confirm => confirm[action], :method => method[action]
  end

  # generates url for form, event can be nested in order or not
  def url_for_order_event(order, event)
    if order.nil?
      seller_event_path(event)
    else
      seller_order_event_path(order, event)
    end
  end
end
