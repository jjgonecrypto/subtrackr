require 'spec_helper'

describe "services/edit.html.erb" do
  before(:each) do
    @service = assign(:service, stub_model(Service,
      :name => "",
      :url => "",
      :desc => "",
      :category => ""
    ))
  end

  it "renders the edit service form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => services_path(@service), :method => "post" do
      assert_select "input#service_name", :name => "service[name]"
      assert_select "input#service_url", :name => "service[url]"
      assert_select "input#service_desc", :name => "service[desc]"
      assert_select "input#service_category", :name => "service[category]"
    end
  end
end
