# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
User.destroy_all
user = User.create(:username => 'justin', :email => 'justinjmoses@gmail.com')

user.subscriptions.create(:service => 'Spotify', :started => Date.new(2011,8,9), :amount => 9.99, :offset => 9)
user.subscriptions.create(:service => 'Netflix', :started => Date.new(2011,1), :amount => 7.95, :offset => 30)
user.subscriptions.create(:service => 'Media Temple Server', :started => Date.new(2011,10,6), :amount => 30, :offset => 6)
user.subscriptions.create(:service => 'Github Micro', :started => Date.new(2011,12,4), :amount => 7, :offset => 4)
user.subscriptions.create(:service => 'Code School', :started => Date.new(2011,11,17), :amount => 25, :offset => 17)

Service.destroy_all

Service.create(name: 'Spotify', url: 'http://spotify.com', desc: 'Streaming music service from Sweeden', category: 'Music',
	schemes:
	[
		{name: "Free", amount: 0},
		{name: "Unlimited", amount: 4.99, frequency: "monthly"},
		{name: "Premium", amount: 9.99, frequency: "monthly"}
	]
)
Service.create(name: 'Netflix', url: 'http://netflix.com', desc: 'Streaming tv and film service from the US', category: 'Film & TV',
	schemes:
	[
		{name: "Streaming", amount: 7.99, frequency: "monthly"},
		{name: "Streaming + DVD", amount: 15.98, frequency: "monthly"}
	]
)
Service.create(name: 'Github', url: 'http://github.com', desc: 'Git code hosting and collaboration', category: 'Developer',
	schemes:
	[
		{name: "Free", amount: 0},
		{name: "Micro", amount: 7, frequency: "monthly"},
		{name: "Small", amount: 12, frequency: "monthly"},
		{name: "Medium", amount: 22, frequency: "monthly"}
	]
)
Service.create(name: 'CodeSchool', url: 'http://codeschool.com', desc: 'Tutorial and video learning series primarily on open source web technologies', category: 'Developer',
	schemes: 
	[
		{name: "Monthly", amount: 25, frequency: "monthly"}
	]
)
Service.create(name: 'SurveyMonkey', url: 'http://surveymonkey.com', desc: 'Surveying and reporting tool', category: 'Business',
	schemes:
	[
		{name: "Basic", amount: 0},
		{name: "Select", amount: 17, frequency: "monthly"},
		{name: "Gold", amount: 25, frequency: "monthly"},
		{name: "Platinum", amount: 65, frequency: "monthly"}
	]
	
)
Service.create(name: 'Amazon', url: 'http://amazon.com', desc: 'Online shopping site', category: 'Shopping',
	schemes: 
	[
		{name: "Amazon Prime", amount: 79, frequency: "yearly"}
	]
)
Service.create(name: 'Wufoo', url: 'http://wufoo.com', desc: 'Online form builder', category: 'Business', 
	schemes: 
	[ 
		{name: "Gratis", amount: 0},
		{name: "Ad Hoc", amount: 14.95, currency: "usd", frequency: "monthly"},
		{name: "Bona Fide", amount: 29.95, currency: "usd", frequency: "monthly"},
		{name: "Carpe Diem", amount: 69.95, currency: "usd", frequency: "monthly"},				
		{name: "Ad Infinitum", amount: 199.95, currency: "usd", frequency: "monthly"}
	]
)


