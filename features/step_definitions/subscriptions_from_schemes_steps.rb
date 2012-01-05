When /^I click the "([^\"]*)" scheme$/ do |scheme_name|
  find("#inline-scheme-chooser button").click
end

Then /^I should see "([^\"]*)" populated with "([^\"]*)"$/ do |field, value|
  find("input#subscription_#{field.to_s.downcase}").value.should eq(value)
end

Then /^I should see "([^\"]*)" populated with todays day of the week$/ do |field|
  find("input#subscription_#{field.to_s.downcase}").value.should eq(Date.today.wday == 0 ? "7" : Date.today.wday.to_s)
end

Then /^I should see "([^\"]*)" populated with todays day of month$/ do |field|
  find("input#subscription_#{field.to_s.downcase}").value.should eq(Date.today.day.to_s)
end

Then /^I should see "([^\"]*)" populated with todays day of year$/ do |field|
  find("input#subscription_#{field.to_s.downcase}").value.should eq(Date.today.yday.to_s)
end