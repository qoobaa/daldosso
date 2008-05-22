class Admin::DependenciesController < ApplicationController
  before_filter :admin_required

  def index
    @dependencies = Dependency.find(:all)
  end

  def new
    @dependency = Dependency.new
  end

  def edit
    @dependency = Dependency.find(params[:id])
  end

  def create
    @dependency = Dependency.new(params[:dependency])
    
    if @dependency.save
      redirect_to admin_dependency_path(@dependency)
      flash[:notice] = 'Dependency was successfully created.'
    else
      render :action => 'new'
    end
    
  end

  def update
    @dependency = Dependency.find(params[:id])
    
    if @dependency.update_attributes(params[:dependency])
      flash[:notice] = 'Dependency was successfully updated.'
      redirect_to admin_dependency_path(@dependency)
    else
      render :action => 'edit'
    end
  end

  def show
    @dependency = Dependency.find(params[:id])
  end

  def destroy
    @dependency = Dependency.find(params[:id])
    @dependency.destroy
    
    redirect_to admin_dependencies_path
  end
end
