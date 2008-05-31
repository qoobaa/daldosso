class GlassTypesController < ApplicationController

  def index
    @short_glass_types = GlassType.search(params[:search])
  end


  def show
    @glass_type = GlassType.find(params[:id])
  end


end
