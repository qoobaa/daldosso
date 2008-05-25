class Contact < ActionMailer::Base
  
  def contact_company(message, email = "simao@fe.up.pt")
   recipients "simaobelchior@gmail.com"
   from  email
   sent_on Time.now
   subject "Message from website contact form"  
   body :message => message
  end
end
