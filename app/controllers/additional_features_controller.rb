class AdditionalFeaturesController < ApplicationController

  def index
    @short_additional_features = AdditionalFeature.search(params[:search], params[:page])
  end

  def show
    @additional_feature = AdditionalFeature.find(params[:id])
  end
end
