class EmployeesController < AdminApplicationController
  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @employee = Employee.new(params[:employee])
    @employee.save
    if @employee.errors.empty?
      self.current_employee = @employee
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

end
