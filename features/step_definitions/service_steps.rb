Given /^I have services titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Service.create!(title: title)
  end
end

Given /^I have no services$/ do
  Service.delete_all
end

Then /^I should have ([0-9]+) services?$/ do |count|
  Service.count.should == count.to_i
end