Given /^there are services named (.+)$/ do |names|
  names.split(', ').each do |name|
    FactoryGirl.create(:service, name: name)
  end
end

Given /^there are no services$/ do
  Service.delete_all
end


When /^I add schemes with the following:$/ do |table|
  table.hashes.each do |hash|
    click_link("Add scheme")  
    within("#inner-schemes") do
      hash.each do |field|
        fill_in(field.first.capitalize, with: field.last)
      end
    end
  end  
end

When /^I submit the form$/ do
  find(:xpath, "//input[@type='submit']").click
end

Given /^there is a service named "([^\"]*)"$/ do |name| 
  FactoryGirl.create(:service, name: name)
end

Given /^there is a service named "([^\"]*)" with the following schemes:$/ do |name, table|
  service = FactoryGirl.create(:service, name: name)
  table.hashes.each do |hash|
    service.schemes.create(hash)
  end
end

When /^I delete the scheme named "([^\"]*)"$/ do |scheme_name|
  within(:xpath, "//*[parent::*[@id='inner-schemes']][descendant::input[@value='#{scheme_name}']]") do 
    click_link("Del")
  end
end

When /^I attach an image "([^\"]*)" as a service logo$/ do |image|
  attach_file("Logo", Rails.root.join('features/artifacts/test.png').to_s)    
end

Then /^I should see an image "([^\"]*)" under "([^\"]*)" service$/ do |image, service|
  find(:xpath, "//img[starts-with(@src,'/system/images/service/logos/#{service.downcase}/#{image}')]")
end