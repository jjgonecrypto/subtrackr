class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps
  
  FREQUENCY_UNITS = [ "daily", "weekly", "monthly", "yearly" ]
  
  field :service,         	:type => String
  field :amount,          	:type => Float
  field :currency,        	:type => String,  :default => "usd"
  field :frequency,  	  	:type => String,  :default => "monthly"
  field :offset,	  	:type => Integer, :default => 1
  field :days_before_notify,	:type => Integer, :default => 2
  field :started,	  	:type => Date,    :default => Date.today
  field :next_bill,		:type => Date
  field :notify_date,		:type => Date

  belongs_to :user

  def self.send_email
      where(:frequency => "monthly", 
	   :offset => ( Date.today + :notify_before).day).each do |subscription|
	     #MemberMailer.subscription_notification(subscription.user, subscription).deliver
	     puts subscription.service + ', ' + subscription.user.email
	     subscription.save! #recalc the next bill
	   end
  end

 # private
  def calc
    next_bill = calc_monthly if frequency == "monthly"
    next_bill = calc_weekly  if frequency == "weekly"
    next_bill = calc_yearly  if frequency == "yearly"

    notify_date = next_bill - days_before_notify
  end 

  private
  def calc_monthly  
    today = Date.today	  
    if (Date::valid_date?(today.year, today.month, offset))
        bill_this_month = Date.new(today.year, today.month, offset)
    else
        bill_this_month = Date.new(today.year, today.month, (today.month == 2) ? 28 : 30)
    end
    (Date.today + days_before_notify >= bill_this_month) ? bill_this_month.next_month : bill_this_month
  end

  def calc_weekly
    today = Date.today

    ((today + days_before_notify).wday >= offset) ? today + 7 - today.wday + offset : today + offset - today.wday 
  end

  def calc_yearly
    today = Date.today

    bill_this_year = Date.new(today.year) + offset - 1 
    (today + days_before_notify >= bill_this_year) ? bill_this_year.next_year : bill_this_year
  end

end

