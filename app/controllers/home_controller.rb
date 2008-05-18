class HomeController < ApplicationController
	def index
          @message = flash[:notice]
          id = session[:customer_id]
          if(id==nil)
            @user = nil
          else
            user = Customer.find(id)
            @user = user.login
          end
	end
end
