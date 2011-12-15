require 'spec_helper'

describe "services/index.html.erb" do
  before(:each) do
    assign(:services, [
      @s1 = stub_model(Service,
        :name => "service",
        :url => "url",
        :desc => "desc",
        :category => "cat"
      ),
      stub_model(Service,
        :name => "service",
        :url => "url",
        :desc => "desc",
        :category => "cat"
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => @s1.name, :count => 2
    assert_select "tr>td", :text => @s1.url, :count => 2
    assert_select "tr>td", :text => @s1.desc, :count => 2
    assert_select "tr>td", :text => @s1.category, :count => 2
  end
end
