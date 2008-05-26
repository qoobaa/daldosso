module Seller::EventsHelper

  def link_to_date(str, date)
    link_to(str, { :y => date.year, :m => date.month, :d => date.day})
  end

  def month_name(date)
    Date::MONTHNAMES[date.month]
  end

  def events_calendar(date, events)
    calendar :month => date.month,
             :year => date.year, 
             :previous_month_text => link_to_date('<', date << 1),
             :next_month_text => link_to_date('>', date >> 1) do |d|
      has_event = false
      events.each { |e| has_event = true if e.added_date.to_date == d || e.due_date.to_date == d }
      if has_event
        [link_to_date(d.day, d), { :class => 'hasEvent' }]
      else
        [link_to_date(d.day, d), { :class => 'noEvent' }]
      end
    end
  end

end
