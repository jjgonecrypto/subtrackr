#example of using Mixin in rake task
#require "#{Rails.root}/lib/frequency"
#include Frequency

namespace :subtrackr do
   task :daily => [:subscription_email]
  
   desc "Send out daily email"
   task :subscription_email => :environment do
      Subscription.check_and_send_notifications
   end
 end