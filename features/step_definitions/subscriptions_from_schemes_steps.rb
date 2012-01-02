When /^I enter "([^\"]*)" as the service$/ do |arg1|
  fill_in("Service", with: "net")
end

When /^I select "([^\"]*)" from the dropdown$/ do |arg1|
  find("ul.ui-autocomplete li a").click
end

When /^I click the "([^\"]*)" scheme$/ do |arg1|
  find("#inlineSchemeChooser button").click
end

Then /^I should see "([^\"]*)" populated with "([^\"]*)"$/ do |arg1, arg2|
  find("input#subscription_#{arg1.to_s.downcase}").value.should eq(arg2)
end

Then /^I should see "([^\"]*)" populated with todays day of the week$/ do |arg1|
  find("input#subscription_#{arg1.to_s.downcase}").value.should eq(Date.today.wday == 0 ? "7" : Date.today.wday.to_s)
end

Then /^I should see "([^\"]*)" populated with todays day of month$/ do |arg1|
  find("input#subscription_#{arg1.to_s.downcase}").value.should eq(Date.today.day.to_s)
end

Then /^I should see "([^\"]*)" populated with todays day of year$/ do |arg1|
  find("input#subscription_#{arg1.to_s.downcase}").value.should eq(Date.today.yday.to_s)
end
