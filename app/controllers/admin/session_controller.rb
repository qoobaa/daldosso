class Admin::SessionController < AdminApplicationController
  def new
  end

  def create
    self.current_employee = Employee.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_employee.remember_me unless current_employee.remember_token?
        cookies[:auth_token] = { :value => self.current_employee.remember_token , :expires => self.current_employee.remember_token_expires_at }
      end
      redirect_back_or_default('/')
      flash[:notice] = "Logged in successfully"
    else
      render :action => 'new'
    end
  end

  def destroy
    self.current_employee.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
