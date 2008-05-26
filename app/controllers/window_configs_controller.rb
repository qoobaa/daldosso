class WindowConfigsController < ApplicationController

  def index
    @isCustomer = false
    @order = Order.find(params[:order_id]) if params[:order_id]
    if (current_user!=nil && current_user.type==Customer)
      @isCustomer = true
      @customer = Customer.find(current_user.id)
      if (@order)
        @winconfigs = @order.window_configs
      else
        @winconfigs = @customer.config_templates
      end
    else
      @winconfigs = []
    end
  end

  def new
    @winconfig = WindowConfig.new
    @handle_types = HandleType.find(:all)
    @glass_colors = GlassColor.find(:all)
    @sash_structures = SashStructure.find(:all)
    @features = []
    if ((session[:wconf]==nil || params[:feature]==nil) && params[:step]!='back')
      @features = Model.find(:all)
      session[:wconf] = []
      flash[:msg] = 'initial'
    end
    if (session[:wconf]!=nil && params[:feature]!=nil && params[:step]!='back')
      session[:wconf] << params[:feature][:id] unless session[:wconf].include?(params[:feature][:id])
      @features = WindowFeature.find(params[:feature][:id]).after_features
      @model_id = session[:wconf][0]
    end
    if (session[:wconf]!=nil && params[:feature]==nil && params[:step]=='back')
      session[:wconf].pop
      if (session[:wconf].size>0)
        last = session[:wconf].last
        @features = WindowFeature.find(last).after_features
        flash[:msg] = 'at least one'
      else
        @features = Model.find(:all)
        flash[:msg] = 'removed last'
      end
    end
    if (session[:wconf]==nil && params[:step]=='back')
      session[:wconf] = []
      flash[:msg] = 'back'
      @features = Model.find(:all)
    end
  end

  def create
    @winconfig = WindowConfig.new(params[:window_config])
    #adding chosen features to window configuration
    features_ids = session[:wconf]
    features_ids.each{|id| @winconfig.window_features << WindowFeature.find(id)}
    @winconfig.customer = current_user if current_user# set user who creates

    isSaved = @winconfig.save if (current_user)
    @msg = "Succesfully saved"
    @msg = "Error " unless (isSaved)
    @msg = "To save your configuration you must be logged in" unless current_user

    if (isSaved)
      session[:wconf]=nil #clears chosen feature's ids table
      redirect_to(@winconfig)
    else
      render :action => 'new'
    end
  end

  def show
    @winconfig = WindowConfig.find(params[:id])
    @order = @winconfig.order_item.order if @winconfig.order_item
    redirect_to window_configs_path unless @winconfig.customer.id == current_user.id
  end

  def edit
    @winconfig = WindowConfig.find(params[:id])
    @model_id = @winconfig.window_features[0].id
    @order = @winconfig.order_item.order if @winconfig.order_item
    unless @order || @order.is_saved?
      flash[:notice] = "Cannot edit window configuration related to order that already is sent"
      redirect_to order_window_config_path(@order.id,@winconfig)
    end
  end

  def update
    @winconfig = WindowConfig.find(params[:id])
    if @winconfig.update_attributes(params[:window_config])
      flash[:notice] = "Updated"
      redirect_to @winconfig
    else
      flash[:notice] = "Error"
      redirect_to window_configs_path
    end
  end

  def destroy
    @winconfig = WindowConfig.find(params[:id])
    @order = @winconfig.order_item.order if @winconfig.order_item
    if (@order)
      @winconfig.order_item.destroy
      @winconfig.destroy
      redirect_to order_window_configs_path(@order)
    else
      @winconfig.destroy
      redirect_to window_configs_path
    end
  end
end
