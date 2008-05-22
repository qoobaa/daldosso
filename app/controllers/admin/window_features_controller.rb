class Admin::WindowFeaturesController < ApplicationController
  before_filter :admin_required

  def index
    @window_features = WindowFeature.find(:all)
  end

  def new
    @window_feature = WindowFeature.new
  end

  def edit
    @window_feature = WindowFeature.find(params[:id])
  end

  def create
    @window_feature = WindowFeature.new
    
    @window_feature.type = params[:window_feature][:type]
    
    if @window_feature.save
      redirect_to admin_window_feature_path(@window_feature)
      flash[:notice] = "Window feature was successfully created."
    else
      render :action => 'new'
    end
  end

  def update
    @window_feature = WindowFeature.find(params[:id])
    
    @window_feature.type = params[:window_feature][:type]
    
    if @window_feature.update_attributes(params[:window_feature])
      flash[:notice] = 'Window feature was successfully updated.'
      redirect_to admin_window_feature_path(@window_feature)
    else
      render :action => 'edit'
    end

  end

  def show
    @window_feature = WindowFeature.find(params[:id])
  end

  def destroy
    @window_feature = WindowFeature.find(params[:id])
    @window_feature.destroy
    
    redirect_to admin_window_features_path
  end

end
