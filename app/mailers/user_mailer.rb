class UserMailer < ActionMailer::Base
  default from: "justinjmoses@gmail.com"
   
  def subscription_notifications(user, subscriptions)
    #TODO put all subscriptions together in text... 	  
    #puts 'delivery to: ' + user.username + ' for ' + subscriptions.count + ' subs.' 
     mail(to: user.email, subject: "subtrackr reminder")
  end
end
