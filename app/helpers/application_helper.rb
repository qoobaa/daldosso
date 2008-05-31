# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def select_options_for(model)
    model.find(:all).collect { |c| [c.name ||= "No name found", c.id] }
  end

  def current_user_home
    case current_user[:type]
    when "Seller"
      link_to "Seller Panel", seller_root_path
    when "ProductionManager"
      link_to "Manager Panel", manager_root_path
    when "Admin"
      link_to "Admin Panel", admin_root_path
    when "Customer"
      link_to "Customer Panel", root_path
    end
  end
end
