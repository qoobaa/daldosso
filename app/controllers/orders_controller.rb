class OrdersController < ApplicationController

  def index
     @isCustomer = false
    if (current_user!=nil && current_user.type==Customer)
      @isCustomer = true
      @customer = Customer.find(current_user.id)
      @orders = @customer.orders
    else
      @orders = []
      redirect_to login_url
    end
  end

  def new
    @order = Order.new
    unless current_user
      flash[:notice] = "You need to be logged in to create order"
      redirect_to orders_url
    end
  end

  def create
    @order = Order.new(params[:order])
    configs = params[:winconf]
    quantities = params[:quantities]
    if (configs)
      configs[:ids].each do |id|
        o = OrderItem.new
        o.quantity = quantities[:ids][id]
        c = WindowConfig.find(id).copy_constructor
        c.save
        o.item = c
        @order.order_items << o
      end
    end
    @order.order_status = OrderStatus.saved
    @order.customer = current_user
    isSaved = @order.save if current_user
    if (isSaved)
      redirect_to @order
    else
      render :action => 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
    unless @order.is_saved?
      flash[:notice] = "You cannot edit this order any more"
      redirect_to :action => 'show', :id => @order
    end
  end

  def update
    @order = Order.find(params[:id])
    items = params[:items] #items checked on form
    quantities = params[:quantities] # quantities of items
    configs = params[:winconf] # winconfigs checked on form
    quantities2 = params[:quantities2] # quantities of winconfigs

    #deleting unchecked items
    unless (params[:show])
      order_items_to_delete = @order.order_items

      #deleting unchecked items
      if (items)
        item_ids = items[:ids] #ids of all checked
        order_items_to_delete.delete_if {|item| item_ids.include?(item.id.to_s)}
      #if checked remove from list to delete
      end

      order_items_to_delete.each do |item|
        item.item.destroy #destroy configuration
        item.destroy #destroy item
        end
    end

    @order = Order.find(params[:id])

    #updating quantities
    if quantities
      error = false
      @order.order_items.each do |item|
        item.quantity = quantities[:ids][item.id.to_s]
        unless item.save
          flash[:error] = "Error updating item. Wrong value"
          error = true
        end
      end
    end
    #adding new items
    if (configs)
      configs[:ids].each do |id|
        o = OrderItem.new
        o.quantity = quantities2[:ids][id]
        c = WindowConfig.find(id).copy_constructor
        c.save
        o.item = c
        @order.order_items << o
      end
    end

    if(params[:send])
      @order.order_status = OrderStatus.requested
    end

    @order.description = params[:description]

    if @order.save
      flash[:notice] = "Succesfully updated"
      redirect_to :action => 'show', :id => @order
    else
      flash[:notice] = "Error during update"
      redirect_to :action => 'index'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.order_items.each do |item|
      item.item.destroy
      item.destroy
    end

    flash[:msg] = "Succesfully deleted"
    flash[:msg] = "Error" unless @order.destroy
    redirect_to orders_path
  end

end
