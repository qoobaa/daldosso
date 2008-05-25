class Contact < ActionMailer::Base
  
  def contact_company(fields)
   recipients "simaobelchior@gmail.com"
   from  fields[:email]
   sent_on Time.now
   subject "[WinXP] Message from website contact form"  
   body :message => fields[:message],
        :name => fields[:name]
  end
end
