class Admin::WindowConfigsController < ApplicationController

  def show
    @window_config = WindowConfig.find(params[:id])
  end

  def new
    @window_config = WindowConfig.new
  end
end