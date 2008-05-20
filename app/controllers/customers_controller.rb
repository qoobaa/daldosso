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
      redirect_to @customer
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end
  
  def show
    @customer = self.current_user
  end
  
  def edit
    @customer = self.current_user
  end
  
  def update
    @customer = params[:customer]
    if @customererrors.empty?
        @customer.save
        redirect_to @customer
        flash[:notice] = "Profile edited successfully!"
    else
      redirect_to edit_customer_path(current_user)
    end
  end
end
