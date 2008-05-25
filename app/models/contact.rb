class Contact < ActionMailer::Base
  
  def contact_company
    # Email header info MUST be added here
   recipients "simaobelchior@gmail.com"
   from  current_user.email
   subject "Thank you for registering with our website"
     
   body :user=> current_user
  end
end
