class WindowFeaturesController < ApplicationController

  def index
    @short_window_features = WindowFeature.search(params[:search], params[:page])
  end

  def show
    @window_feature = WindowFeature.find(params[:id])
  end
end
