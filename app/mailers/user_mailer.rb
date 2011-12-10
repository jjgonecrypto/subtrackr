class UserMailer < ActionMailer::Base
  default from: "justinjmoses@gmail.com"
   
  def subscription_notifications(user, subscriptions)
    #TODO put all subscriptions together in text... 	  
     mail(to: user.email, subject: "subtrackr reminder")
  end
def
