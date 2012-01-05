Given /^I am a user with the username of "([^\"]*)"$/ do |username|
  user = FactoryGirl.create(:user, username: username)
  #TODO: log in via devise
end