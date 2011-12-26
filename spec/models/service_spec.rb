require 'spec_helper'

describe Service do
  context "definition" do
    it { should be_kind_of(Mongoid::Document) }
    it { should be_timestamped_document }
    it { should have_fields(:name, :url, :desc, :category).of_type(String) }
    it { should embed_many(:schemes)}  
  end

  context "saving" do 
    subject { FactoryGirl.build(:service) }
    it "should save embedded schemes" do
      subject.schemes.size.should eq(2)
      subject.schemes[0].service.should eq(subject)
      subject.schemes[1].service.should eq(subject)
      subject.save.should eq(true)
    end
  end

  context "scheme validation" do
    subject { FactoryGirl.build(:service) }
    it "should fail for broken scheme validation" do
      subject.schemes.new(amount: 12.3, offset: 100)
      expect { subject.save! }.to raise_error
      subject.save.should eq(false)
    end
  end
end