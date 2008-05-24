class CustomersController < ApplicationController

  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @customer = Customer.new(params[:customer])
    @customer.save
    if @customer.errors.empty?
      self.current_user = @customer
      #redirect_back_or_default('/')
      redirect_to user_path
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

end
