namespace :subtrackr do
   desc "Send out daily email"
   task :dailyemail => :environment do
     @users = User.where(:subscriptions.service => 'Spot')
     
     @users.each {|u| 
     puts 'found ' + u.username
   }
   end
 end