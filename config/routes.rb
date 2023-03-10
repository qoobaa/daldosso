ActionController::Routing::Routes.draw do |map|
  map.resources :customers
  map.resources :window_configs
  map.resources :product_groups
  map.resources :products
  map.resources :product_configs
  map.resources :call_statuses
  map.resources :calls
  map.resources :orders, :has_many => :window_configs
  map.resources :contact, :controller => 'contact'
  map.resources :order_statuses
  map.resources :events
  map.resources :event_types
  map.resources :shutter_types
  map.resources :shutter_configs
  map.resources :materials, :controller =>'material'
  map.resources :additional_features
  map.resources :glass_types
  map.resources :window_features

  map.root :controller => 'site'
  map.resource :user, :controller => 'user', :member => { :change_password => :get, :change_password_update => :put }
  map.resource :session, :controller => 'session'

  map.signup '/signup', :controller => 'customers', :action => 'new'
  map.login '/login', :controller => 'session', :action => 'new'
  map.logout '/logout', :controller => 'session', :action => 'destroy'

  map.namespace :seller do |seller|
    seller.root :controller => 'panel'
    seller.resources :events
    seller.requested '/orders/requested_index', :controller => 'seller/orders', :action => 'requested_index'
    seller.resources :orders, :has_many => [:window_configs, :shutter_configs, :product_configs, :events]
    seller.resources :customers
  end

  map.namespace :manager do |manager|
    manager.root :controller => 'panel'
    manager.resources :orders, :has_many => :events
  end

  map.namespace :admin do |admin|
    admin.root :controller => 'panel'
    admin.resources :orders
    admin.resources :order_statuses
    admin.resources :order_items
    admin.resources :users
    admin.resources :window_configs
    admin.resources :window_features
    admin.resources :dependencies
    admin.resources :additional_features
    admin.resources :glass_types
    admin.resources :glass_colors
    admin.resources :handle_types
    admin.resources :structures
    admin.resources :product_groups
    admin.resources :products
    admin.resources :product_configs
    admin.resources :call_statuses
    admin.resources :calls
    admin.resources :events
    admin.resources :event_types
    admin.resources :shutter_types
    admin.resources :shutter_configs
  end

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  # See how all your routes lay out with "rake routes"
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
