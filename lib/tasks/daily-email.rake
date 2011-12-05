require "#{Rails.root}/lib/frequency"
include Frequency

namespace :subtrackr do
   desc "Send out daily email"
   task :dailyemail => :environment do
     
     users = User.where(:subscriptions.exists => true, :email.exists => true)
    
     
     users.each do |u|
       
       u.subscriptions.each do |s|
          puts 'monthly' if s.monthly?
       end
     
    end
   end
 end