Given /^I am a user with the username of "([^\"]*)"$/ do |arg1|
  user = FactoryGirl.create(:user, username: arg1)
  #TODO: log in via devise
end