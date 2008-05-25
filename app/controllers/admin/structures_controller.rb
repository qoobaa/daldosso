class Admin::StructuresController < ApplicationController
  before_filter :admin_required

  def index
    @structures = Structure.find(:all)
  end

  def new
    @structure = Structure.new
  end

  def edit
    @structure = Structure.find(params[:id])
  end

  def create
    @structure = Structure.new(params[:structure])
    if @structure.save
      redirect_to admin_structure_path(@structure)
      flash[:notice] = 'Structure was successfully created.'
    else
      render :action => 'new'
    end
  end

  def update
    @structure = Structure.find(params[:id])
    if @structure.update_attributes(params[:structure])
      flash[:notice] = 'Structure was successfully updated.'
      redirect_to admin_structure_path(@structure)
    else
      render :action => 'edit'
    end
  end

  def show
    @structure = Structure.find(params[:id])
  end

  def destroy
    @structure = Structure.find(params[:id])
    @structure.destroy
    redirect_to admin_structures_path
  end

end
