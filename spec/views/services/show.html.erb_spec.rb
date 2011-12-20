require 'spec_helper'

describe "services/show.html.erb" do
  before(:each) do
    @service = assign(:service, stub_model(Service,
      :name => "",
      :url => "",
      :desc => "",
      :category => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
