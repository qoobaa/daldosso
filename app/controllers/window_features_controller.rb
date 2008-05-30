class WindowFeaturesController < ApplicationController

  def index
    @short_window_features = WindowFeature.find(:all, :conditions=>['type LIKE ? OR type LIKE ? OR type LIKE ?','Wood','Model','Typology'], :order => 'type')
  end

  def show
    @window_feature = WindowFeature.find(params[:id])
  end
end
