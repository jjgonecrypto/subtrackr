##paths
# eg. Given I am on the list of services
# eg. When I go to a new service
# eb. Given I am on edit the service named "Spotify"

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end


##form helpers
# eg. When I enter in "Netflix" as the name
# eb. When I enter in "monthly" as the frequency

When /^I enter in "([^\"]*)" as the (.+)$/ do |value, field|
  fill_in(field.capitalize, with: value)
end


##content helpers
#
Then /^I should not see "([^\"]*)"$/ do |content|
  page.should_not have_content(content)
end

Then /^I should see "([^\"]*)"$/ do |content|
  page.should have_content(content)
end

##jQuery ui helpers
# autocomplete list item selector
When /^I select "([^\"]*)" from the autocomplete dropdown$/ do |arg1|
  find("ul.ui-autocomplete li a").click
end