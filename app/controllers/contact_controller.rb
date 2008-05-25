class ContactController < ApplicationController
  
  def send
    if request.post?
     Contact.deliver_contact_company(params[:body],params[:email])
     flash[:notice] = "Message sent OK!" # notify successful send
     redirect_to login_path # or wherever you wanna go
    end
  end
  
  def new
  end
end