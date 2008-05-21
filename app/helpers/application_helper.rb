# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def select_options_for(model)
    model.find(:all).collect { |c| [c.name ||= "No name found", c.id] }
  end
end
