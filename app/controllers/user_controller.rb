class UserController < ApplicationController

  before_filter :login_required

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    params[:user][:password] = params[:user][:password_confirmation] = nil
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User profile was successfully updated.'
      redirect_to user_path
    else
      render :action => 'edit'
    end
  end

  def change_password
    @user = current_user
  end

  def change_password_update
    @user = current_user
    if User.authenticate(@user.login, params[:current_password])
      @user.password = params[:new_password]
      @user.password_confirmation = params[:new_password_confirmation]
      if current_user.save
        flash[:notice] = 'Password successfully updated.'
        redirect_to user_path
      else
        render :action => 'change_password'
      end
    else
      flash[:error] = 'Current password is incorrect'
      render:action => 'change_password'
    end
  end

end
