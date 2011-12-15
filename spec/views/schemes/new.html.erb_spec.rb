require 'spec_helper'

describe "schemes/new.html.erb" do
  before(:each) do
    assign(:scheme, stub_model(Scheme,
      :name => "",
      :amount => "",
      :currency => "",
      :frequency => ""
    ).as_new_record)
  end

  it "renders new scheme form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => schemes_path, :method => "post" do
      assert_select "input#scheme_name", :name => "scheme[name]"
      assert_select "input#scheme_amount", :name => "scheme[amount]"
      assert_select "input#scheme_currency", :name => "scheme[currency]"
      assert_select "input#scheme_frequency", :name => "scheme[frequency]"
    end
  end
end
