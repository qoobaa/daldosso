class Admin::WindowFeaturesController < ApplicationController
  before_filter :admin_required

  def index
    @window_features = WindowFeature.find(:all)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    @user.type = params[:user][:type]

    @user.save
    if @user.errors.empty?
      redirect_to admin_user_path(@user)
      flash[:notice] = "Thanks for signing up!"
    else
      @user.password = @user.password_confirmation = nil
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    @user.type = params[:user][:type]

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to admin_user_path(@user)
    else
      @user.password = @user.password_confirmation = nil
      render :action => 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to(admin_users_url)
  end

end
