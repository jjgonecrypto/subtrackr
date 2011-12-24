require 'spec_helper'

describe Service do
  context "definition" do
    it { should be_kind_of(Mongoid::Document) }
    it { should be_timestamped_document }
    it { should have_fields(:name, :url, :desc, :category).of_type(String) }
  end

  context "submission" do 
    subject { Factory(:service) }
    let ('subject.schemes') { [ Factory(:scheme, service: subject), Factory(:scheme, service: subject) ] }
    #it { should accept_attributes_for(:schemes)}
  end
end
