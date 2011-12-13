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

  context "future monthly date testing" do
    subject { Factory(:subscription, offset: 15) } 
      
    let(:offset) {subject.offset}
    let(:notify) {subject.days_before_notify}
       
    it "ensures dates are correctly placed in the following month and year" do
       Timecop.freeze(Date.new(2010,12,19)) do 
	  subject.next_bill.should == Date.new(2011,1,offset) 
          subject.notify_date.should == Date.new(2011,1,offset) - notify; 
       end
    end
  end

  context "future monthly date testing next month" do
    subject { Factory(:subscription, offset: 26) } 
      
    let(:offset) {subject.offset}
    let(:notify) {subject.days_before_notify}
       
    it "ensures dates are correctly placed in the current month" do
       year = 2013
       month = 3 
       day = 5
       Timecop.freeze(Date.new(year,month,day)) do 
	  subject.next_bill.should == Date.new(year,month,offset) 
          subject.notify_date.should == subject.next_bill - notify; 
       end
    end
  end

  context "future monthly date short months" do
    subject { Factory(:subscription, offset: 31) } 
      
    let(:offset) {subject.offset}
    let(:notify) {subject.days_before_notify}
       
    it "ensures dates are correctly placed in the current short month" do
       year = 2012
       month = 2
       day = 22
       Timecop.freeze(Date.new(year,month,day)) do 
	  subject.next_bill.should == Date.new(year,month,28) 
          subject.notify_date.should == subject.next_bill - notify; 
       end
    end
  end

  context "ensure subscription mailer" do
    before (:each) do
       @bill = Date.new(Date.today.year, Date.today.month, 1)
       @user = User.create(username: 'test', email: 'justinjmoses@gmail.com');
       @user.subscriptions.create!(offset: @bill.day, service: 'test', amount: 4.44)
       @user.subscriptions.create!(offset: @bill.day, service: 'another', amount: 10) 
    end
    it "correctly calls mailer when subscriptions are due" do
       Timecop.freeze((@bill.next_month) - 2) do 
          Subscription.check_and_send_notifications
          UserMailer.should_receive(:subscription_notification)
       end
    end 	    
    after (:each) do
       #@user.delete
    end
  end
=begin JM: commented until weekly is implemented
  context "future weekly date testing" do
    subject { Factory(:subscription, offset: 4, frequency: "weekly") } 
      
    let(:offset) {subject.offset}
    let(:notify) {subject.days_before_notify}
       
    it "ensures dates are correctly placed in the current week" do
       year = 2011
       month = 12
       day = 9 #this date is a friday - offset of 5
       Timecop.freeze(Date.new(year,month,day)) do 
	  subject.next_bill.should == Date.today + 6 
          subject.notify_date.should == subject.next_bill - notify; 
       end
    end
  end
=end

  #it "should throw errors if invalid frequency is set"
  #if frequency is invalid, should throw error
end
