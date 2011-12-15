class UserMailer < ActionMailer::Base
  default from: "justinjmoses@gmail.com"
   
  def subscription_notifications(user, subscriptions)
     @user = user
     @subscriptions = subscriptions
     puts 'attempt email: ' + user.email  + ' about ' + subscriptions.count.to_s + ' subscriptions.'
     mail(to: user.email, subject: "subtrackr reminder")
     puts 'emailed: ' + user.email + ' about ' + subscriptions.count.to_s + ' subscriptions.'
  end
end
