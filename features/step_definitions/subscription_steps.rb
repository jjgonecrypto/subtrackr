When /^I go to a new subscription$/ do
  visit new_user_subscription_path(User.last)
end