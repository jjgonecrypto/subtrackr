require 'spec_helper'

describe "services/edit.html.erb" do
  before(:each) do
    @service = FactoryGirl.create(:service)
    FactoryGirl.create(:scheme, service: @service)
    FactoryGirl.create(:scheme, service: @service)
    FactoryGirl.create(:scheme, service: @service)  
  end

  it "renders the edit service form" do
    render

    assert_select "form", action: services_path(@service), method: "post" do
      ["name", "url", "desc", "category"].each do |field|
        assert_select "input#service_#{field}", name: "service[#{field}]", value: @service.send(field)
      end

      (0..2).each do |i| #for each schemes within the service
        ["name", "amount", "offset", "frequency", "currency"].each do |field|
          assert_select "input#service_schemes_attributes_#{i}_#{field}", name:"service[schemes_attributes][#{i}][#{field}]", value: @service.schemes[i].send(field)
        end
      end
    end
  end
end
