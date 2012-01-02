require 'spec_helper'

describe "services/new.html.erb" do
  before(:each) do
    @service = FactoryGirl.build(:service)
  end

  it "renders new service form" do
    render

    assert_select "form", action: services_path, method: "post" do
      ["name", "url", "desc", "category"].each do |field|
        assert_select "input#service_#{field}", name: "service[#{field}]"
      end
    end
  end
end
