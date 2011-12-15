require 'spec_helper'

describe "schemes/show.html.erb" do
  before(:each) do
    @scheme = assign(:scheme, stub_model(Scheme,
      :name => "",
      :amount => "",
      :currency => "",
      :frequency => ""
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
