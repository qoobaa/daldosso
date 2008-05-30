class AdditionalFeaturesController < ApplicationController
  

  def index
    @short_additional_features = AdditionalFeature.find(:all)
  end

  def show
    @additional_feature = AdditionalFeature.find(params[:id])
  end
end
