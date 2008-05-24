class Admin::AdditionalFeaturesController < ApplicationController
  before_filter :admin_required

  def index
    @additional_features = AdditionalFeature.find(:all)
  end

  def new
    @additional_feature = AdditionalFeature.new
  end

  def create
    @additional_feature = AdditionalFeature.new(params[:additional_feature])
    if @additional_feature.save
      flash[:notice] = 'Additional feature was successfully created.'
      redirect_to admin_additional_feature_path(@additional_feature)
    else
      render :action => 'new'
    end
  end

  def edit
    @additional_feature = AdditionalFeature.find(params[:id])
  end

  def update
    @additional_feature = AdditionalFeature.find(params[:id])
    if @additional_feature.update_attributes(params[:additional_feature])
      flash[:notice] = 'Additional feature was successfully updated.'
      redirect_to admin_additional_feature_path(@additional_feature)
    else
      render :action => 'edit'
    end
  end

  def show
    @additional_feature = AdditionalFeature.find(params[:id])
  end

  def destroy
    @additional_feature = AdditionalFeature.find(params[:id])
    @additional_feature.destroy
    redirect_to admin_additional_features_path
  end

end
