class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps
  
  before_create :set_next_bill
  
  FREQUENCY_UNITS = [ "day", "week", "month", "year" ]
  
  field :service,         :type => String
  field :amount,          :type => Float
  field :currency,        :type => String,  :default => "usd"
  field :frequency_unit,  :type => String,  :default => "month"
  field :frequency_amount,:type => Integer, :default => 1
  field :next_bill,       :type => Date
  
  embedded_in :user
  
  protected 
  def set_next_bill
    next_bill = Time.new + frequency_amount.send(frequency_unit)
  end

end