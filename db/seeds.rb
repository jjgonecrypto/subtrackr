# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
User.destroy_all
user = User.create(:username => 'justin', :email => 'justinjmoses@gmail.com', :password => '123123', :password_confirmation => '123123')

user.subscriptions.create(:service => 'Spotify', :started => Date.new(2011,8,9), :amount => 9.99, :offset => 9)
user.subscriptions.create(:service => 'Netflix', :started => Date.new(2011,1), :amount => 7.95, :offset => 30)
user.subscriptions.create(:service => 'Media Temple Server', :started => Date.new(2011,10,6), :amount => 30, :offset => 6)
user.subscriptions.create(:service => 'Github Micro', :started => Date.new(2011,12,4), :amount => 7, :offset => 4)
user.subscriptions.create(:service => 'Code School', :started => Date.new(2011,11,17), :amount => 25, :offset => 17)
