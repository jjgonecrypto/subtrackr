class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  before_create :calculate_monthly_reminder_day, :if => :monthy?

  field :service,            :type => String
  field :amount,             :type => Float
  field :currency,           :type => String,  :default => "usd"
  field :started,            :type => Date,    :default => Date.today

  field :billing_frequency,        :type => String,  :default => "monthly"
  field :billing_day_of_frequency, :type => Integer
  field :reminder_buffer           :type => Integer
  field :day_to_remind_on          :type => Integer

  attribute_protected :day_to_remind_on

  FREQUENCY_UNITS = [ "daily", "weekly", "monthly", "yearly" ]

  def monthly?
    self.frequency == "monthly"
  end

  def self.send_monthly_nofitications
    where(:frequency => "monthly", :day_to_remind_on => Date.today.day).each do |subscription|
      #do shit
    end
  end

  private

  def calculate_monthly_reminder_day
    # calculate the day to remind on
    day = billing_day_frequency - reminder_buffer
    # if the day is in a previous month
    day = 28 + day if day < 1
    self.reminder = day
  end
end
