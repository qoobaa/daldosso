class Contact < ActionMailer::Base
  
  def contact_company(fields)
   recipients 'simaobelchior@gmail.com'
   sent_on Time.now
   subject "[WinXP] Message from website contact form"  
   body :message => fields[:body],
        :name => fields[:name],
        :email => fields[:email]
  end
end
