class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps
  
  FREQUENCY_UNITS = [ "daily", "weekly", "monthly", "yearly" ]
  
  field :service,           type: String
  field :amount,            type: Float
  field :currency,          type: String,  default: "usd"
  field :frequency,         type: String,  default: "monthly"
  field :offset,            type: Integer, default: 1
  field :days_before_notify,type: Integer, default: 2
  field :started,           type: Date,    default: Date.today
  field :next_bill,         type: Date
  field :notify_date,       type: Date

  belongs_to :user, :inverse_of => :subscriptions
  
  before_save :calculate_billing_and_notification_dates

  def self.check_and_send_notifications
     users = Hash.new
     where(:frequency => "monthly", :notify_date => Date.today).each do |subscription| 
        users[subscription.user] ||= [] 
        users[subscription.user].push(subscription)    
     end

     users.each do |user, subs|
        UserMailer.subscription_notifications(user, subs).deliver
        subs.each { |s| s.save } #update billing dates
     end
    
  end

  private
  def calculate_billing_and_notification_dates
    self.next_bill = calc_monthly if self.frequency == "monthly"
    #JM: TODO self.next_bill = calc_weekly  if self.frequency == "weekly"
    #JM: TODO self.next_bill = calc_yearly  if self.frequency == "yearly"

    self.notify_date = self.next_bill - self.days_before_notify
  end 

  def calc_monthly  
    today = Date.today    
    if (Date::valid_date?(today.year, today.month, self.offset))
        bill_this_month = Date.new(today.year, today.month, self.offset)
    else
        bill_this_month = Date.new(today.year, today.month, (today.month == 2) ? 28 : 30)
    end
    (Date.today + days_before_notify >= bill_this_month) ? bill_this_month.next_month : bill_this_month
  end

=begin
  def calc_weekly
    #JM: this is buggy because SUN = 0. If the offset is 0 it breaks the algorithm    
    today = Date.today

    ((today + self.days_before_notify).wday >= self.offset || (today.self.days_before_notify).wday == 0)) 
    ? today + 7 - today.wday + self.offset 
    : today + self.offset - today.wday 
  end

  def calc_yearly
    today = Date.today

    bill_this_year = Date.new(today.year) + self.offset - 1 
    (today + self.days_before_notify >= bill_this_year) ? bill_this_year.next_year : bill_this_year
  end
=end

end

