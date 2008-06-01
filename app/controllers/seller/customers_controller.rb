class Seller::CustomersController < ApplicationController
       before_filter :seller_required
  def index
    @customers = Customer.paginate :page => params[:page], :per_page => 10
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(params[:customer])

    @customer.save
    if @customer.errors.empty?
      redirect_to seller_customer_path(@customer)
      flash[:notice] = "Created new customer"
    else
      render :action => 'new'
    end
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update_attributes(params[:customer])
      flash[:notice] = 'Customer was successfully updated.'
      redirect_to seller_customer_path(@customer)
    else
      render :action => 'edit'
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to(seller_customers_url)
  end

end
