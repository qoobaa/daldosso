# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
<<<<<<< HEAD:app/helpers/application_helper.rb
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files)}
=======
  def select_options_for(model)
    model.find(:all).collect { |c| [c.name ||= "No name found", c.id] }
>>>>>>> kuba/master:app/helpers/application_helper.rb
  end
end
