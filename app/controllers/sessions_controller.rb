# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  # render new.rhtml
  def new
    @user = nil
  end

  def create
    self.current_customer = Customer.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_customer.remember_me unless current_customer.remember_token?
        cookies[:auth_token] = { :value => self.current_customer.remember_token , :expires => self.current_customer.remember_token_expires_at }
      end
      redirect_to :controller => 'home'
      flash[:notice] = "Logged in successfully"
    else
      flash[:notice] = "Wrong login or password"
      render :action => 'new'
    end
  end

  def destroy
    self.current_customer.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_to :controller => 'home'
  end
end
