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
             :first_day_of_week => 1,
             :previous_month_text => link_to_date('&lt;', date << 1),
             :next_month_text => link_to_date('&gt;', date >> 1) do |d|

      css_class = ''

      # change to 'hasEvent' class if day has an event
      events.each { |e| css_class = 'hasEvent' if e.added_date.to_date == d || e.due_date.to_date == d }

      # add 'activeDay' class if day is the current day
      css_class += ' activeDay' if date == d

      [link_to_date(d.day, d), { :class => css_class }]
    end
  end

end
