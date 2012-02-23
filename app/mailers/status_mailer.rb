class StatusMailer < ActionMailer::Base
  default :from => "ruby@gylion.net"  
  
  def joiner_notification(bid)
    @bid = bid
    @user = @bid.user
    
    mail(:to => @user.email, :subject => "New joiner to your bid")  
  end  
end
