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
    it { should belong_to(:user).of_type(User).as_inverse_of(:subscriptions) }
  end

  context "billing and notify dates" do
    subject { FactoryGirl.create(:subscription) } 
    let!(:notify_days) {subject.days_before_notify}

    it "should ensure billing is set on save" do
       subject.next_bill.should_not be_nil
       subject.notify_date.should_not be_nil 
    end
    
    it "should ensure notify date is correct distance prior" do 
       (subject.next_bill - subject.notify_date).should eq(notify_days)
    end
  end

  context "future monthly date testing" do
    subject { FactoryGirl.create(:subscription, offset: 15) } 
      
    let(:offset) {subject.offset}
    let(:notify) {subject.days_before_notify}
       
    it "ensures dates are correctly placed in the following month and year" do
       Timecop.freeze(Date.new(2010,12,19)) do 
	        subject.next_bill.should eq(Date.new(2011,1,offset)) 
          subject.notify_date.should eq(Date.new(2011,1,offset) - notify) 
       end
    end
  end

  context "future monthly date testing next month" do
    subject { FactoryGirl.create(:subscription, offset: 26) } 
      
    let(:offset) {subject.offset}
    let(:notify) {subject.days_before_notify}
       
    it "ensures dates are correctly placed in the current month" do
       year = 2013
       month = 3 
       day = 5
       Timecop.freeze(Date.new(year,month,day)) do 
          subject.next_bill.should eq(Date.new(year,month,offset))
          subject.notify_date.should eq(subject.next_bill - notify) 
       end
    end
  end

  context "future monthly date short months" do
    subject { FactoryGirl.create(:subscription, offset: 31) } 
      
    let(:offset) {subject.offset}
    let(:notify) {subject.days_before_notify}
       
    it "ensures dates are correctly placed in the current short month" do
       year = 2012
       month = 2
       day = 22
       Timecop.freeze(Date.new(year,month,day)) do 
	        subject.next_bill.should eq(Date.new(year,month,28)) 
          subject.notify_date.should eq(subject.next_bill - notify) 
       end
    end
  end

  context "ensure subscription mailer" do
    let(:bill) { Date.today }
    let!(:user1) { FactoryGirl.create(:user) }
    let!(:user2) { FactoryGirl.create(:user) }
    let!(:sub1) { FactoryGirl.create(:subscription, user: user1, service: 'test1', amount: 4.44, offset: bill.day) }
    let!(:sub2) { FactoryGirl.create(:subscription, user: user1, service: 'test2', amount: 5, offset: bill.day) }
    let!(:sub3) { FactoryGirl.create(:subscription, user: user2, service: 'test3', amount: 12, offset: bill.day) }
    let!(:sub4) { FactoryGirl.create(:subscription, user: user2, service: 'test4', amount: 0, offset: (Date.today - 4).day) }
    let (:mailer) { mock }

    before do
       UserMailer.stubs(:subscription_notifications => mailer)
       UserMailer.expects(:subscription_notifications).with(user1, user1.subscriptions.to_a).once.returns(mailer)
       UserMailer.expects(:subscription_notifications).with(user2, [sub3]).once.returns(mailer)
       mailer.expects(:deliver).twice
    end

    it "correctly calls mailer when subscriptions are due" do
       Timecop.freeze((bill.next_month) - 3) do 
          Subscription.check_and_send_notifications
       end
    end 
  end
end
