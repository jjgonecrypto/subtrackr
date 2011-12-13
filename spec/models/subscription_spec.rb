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

  after (:each) do
     User.delete_all
     Subscription.delete_all
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
       @bill = Date.today
       @u1 = User.create(username: 'test', email: 'u1@gmail.xxxx')
       @u1.subscriptions.create!(offset: @bill.day, service: 'test', amount: 4.44)
       @u1.subscriptions.create!(offset: @bill.day, service: 'another', amount: 10) 
       @u2 = User.create(username: 't', email: 'u2@gmail.xxx')
       @sub = @u2.subscriptions.create!(offset: @bill.day, service: 'whatever', amount: 19.32)
       @u2.subscriptions.create!(offset: (Date.today - 4).day, service: 'thing', amount: 2) 
       @mailer = mock()
    end
    it "correctly calls mailer when subscriptions are due" do
       Timecop.freeze((@bill.next_month) - 2) do 
          UserMailer.expects(:subscription_notifications).with(@u1, @u1.subscriptions.to_a).once.returns(@mailer)
	  UserMailer.expects(:subscription_notifications).with(@u2, [@sub]).once.returns(@mailer)
          @mailer.expects(:deliver).twice
	  Subscription.check_and_send_notifications
       end
    end 
  end
end
