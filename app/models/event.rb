class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :user
  belongs_to :order
  validates_presence_of :due_date, :added_date, :user, :order, :event_type

  def self.find_all_in_month(date)
    datetime = date.to_datetime
    from = datetime.beginning_of_month
    to = datetime.end_of_month
    find(:all, :conditions => ["added_date BETWEEN ? AND ? OR due_date BETWEEN ? AND ?",
                               from,
                               to,
                               from,
                               to])
  end

  def self.find_due_in_month(date)
    datetime = date.to_datetime
    find(:all, :conditions => { :due_date =>  (datetime.beginning_of_month)..(datetime.end_of_month) })
  end

  def self.find_added_in_month(date)
    datetime = date.to_datetime
    find(:all, :conditions => { :added_date => (datetime.beginning_of_month)..(datetime.end_of_month) })
  end

  def self.find_due_on_day(date)
    find(:all, :conditions => { :due_date => (date.beginning_of_day)..(date.end_of_day) })
  end

  def self.find_added_on_day(date)
    find(:all, :conditions => { :added_date => (date.beginning_of_day)..(date.end_of_day) })
  end

end
