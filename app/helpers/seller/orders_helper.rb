module Seller::OrdersHelper
  # generates link tag for polymorphic OrderItem model, based on:
  # - what type of item is it
  # - what action should this link generate
  # - in which view it is generated
  def order_item_link(item, action, view)
    prefix = "#{item.order.id}/" if (view.to_s == 'show') || (view.to_s == 'requested')
    prefix = "orders/#{item.order.id}/" if view.to_s == 'index'
    sufix = "/edit" if action.to_s == 'edit'
    link = "#{prefix}#{item.path_part}s/#{item.item_id}#{sufix}"
    name = { :delete => 'Delete', :show => "#{item.name rescue "[No Name]"}", :edit => 'Edit'}
    confirm = { :delete => "Are you sure?", :show => false, :edit => false}
    method = { :delete => :delete, :show => :get, :edit => :get}
    link_to name[action], link, :confirm => confirm[action], :method => method[action]
  end

end
