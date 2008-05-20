class UserController < ApplicationController

  before_filter :login_required

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.authenticate(params[:user][:login], params[:old_password])
    if @user.nil?
      @user = current_user
      @user.errors.add :old_password
      render :action => 'edit'
    else 
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User profile was successfully updated.'
        redirect_to user_path
      else
        @user.password = @user.password_confirmation = nil
        render :action => 'edit'
      end
    end
  end

end
