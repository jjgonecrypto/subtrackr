require 'spec_helper'

describe "services/new.html.erb" do
  before(:each) do
    assign(:service, stub_model(Service,
      :name => "",
      :url => "",
      :desc => "",
      :category => ""
    ).as_new_record)
  end

  it "renders new service form" do
    render

    assert_select "form", :action => services_path, :method => "post" do
      assert_select "input#service_name", :name => "service[name]"
      assert_select "input#service_url", :name => "service[url]"
      assert_select "input#service_desc", :name => "service[desc]"
      assert_select "input#service_category", :name => "service[category]"
    end
  end
end
