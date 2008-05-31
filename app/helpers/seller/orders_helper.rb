module Seller::OrdersHelper

  def order_item_link(item, action, view)
    prefix = "#{item.order.id}/" if view.to_s == 'show'
    prefix = "orders/#{item.order.id}/" if view.to_s == 'index'
    sufix = "/edit" if action.to_s == 'edit'
    link = "#{prefix}#{item.path_part}s/#{item.item_id}#{sufix}"
    name = { :delete => 'Delete', :show => "#{item.name rescue ''}", :edit => 'Edit'}
    confirm = { :delete => "Are you sure?", :show => false, :edit => false}
    method = { :delete => :delete, :show => :get, :edit => :get}
    link_to name[action], link, :confirm => confirm[action], :method => method[action]
  end

end
