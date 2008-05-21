class WindowConfigsController < ApplicationController

  def new
    session[:winconf]=nil
    @winconfig = WindowConfig.new
    
    if ((session[:wconf]==nil || params[:feature]==nil) && params[:step]!='back')
      @features = Model.find(:all)
      session[:wconf] = []
      flash[:msg] = 'initial'
    end
    if (session[:wconf]!=nil && params[:feature]!=nil && params[:step]!='back')
      session[:wconf] << params[:feature][:id]
      @features = WindowFeature.find(params[:feature][:id]).after_features
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
    if (session[:wconf]==nil)
       redirect_to new_window_config_path
    end
    @features = []
    features_ids = session[:wconf]
    features_ids.each{|id| @winconfig.window_features << WindowFeature.find(id)}
    @cost = 0
    for i in 0..features_ids.size-2
      id = features_ids[i]
      id_next = features_ids[i+1]
      feature_before = WindowFeature.find(id)
      feature_after = WindowFeature.find(id_next)
      dependency = feature_before.dependencies_before.detect{|db| db.after_feature==feature_after}
      @cost+= dependency.price!=nil ? dependency.price : 0
    end
    session[:winconf] = @winconfig
  end
  
  def save
    @winconfig = session[:winconf]  
    if @winconfig.save
      @msg = "Succesfully saved"
    else
      @msg = "Error"
    end
    session[:wconf]=nil
    session[:winconf]=nil
  end
  
end
