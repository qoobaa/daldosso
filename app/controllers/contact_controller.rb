class ContactController < ApplicationController
  
  def create
    Contact.deliver_contact_company(params[:contact])
    flash[:notice] = "Message sent OK!" # notify successful send
    redirect_to :controller=>'contact', :action=>'new' # or wherever you wanna go
  end
  
  def new
  end
end