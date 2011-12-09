require 'spec_helper'

describe Subscription do
  context "definition" do
    it { should be_kind_of(Mongoid::Document) }
    it { should be_timestamped_document }

    it { should have_field(:service) }
    it { should have_field(:amount).of_type(Float) }
    it { should have_field(:frequency).of_type(String).with_default_value_of("monthly") }
    it { should have_fields(:offset, :days_before_notify).of_type(Integer) }
    it { should have_fields(:started, :next_bill, :notify_date).of_type(Date) } 
    it { should belong_to(:user).of_type(User) }
  end

  context "billing and notify dates" do
    subject { Factory(:subscription) } 
    let!(:notify_days) {subject.days_before_notify}

    it "should ensure billing is set on save" do
       subject.next_bill.should_not be_nil
       subject.notify_date.should_not be_nil 
    end
    
    it "should ensure notify date is correct distance prior" do 
       (subject.next_bill - subject.notify_date).should == notify_days
    end

        
     
  end

  context "future date testing" do
    #Timecop.travel(Date.new(2010,12,19)) 
      #subject { Factory(:subscription)}
      subject do  
	 Timecop.travel(Date.new(2010,12,19)) 
         sub = Factory(:subscription) 
      end
      
      let!(:offset) {subject.offset}
       
      it "ensures dates are correctly placed in the future" do
        subject.next_bill.should == Date.new(2011, 1, 15)  
      end
     
    #Timecop.return
  end 
  #it "should throw errors if invalid frequency is set"
  #if frequency is invalid, should throw error
end
