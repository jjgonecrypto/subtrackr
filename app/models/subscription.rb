class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :service, :type => String
  field :frequency
  
  embedded_in :user

  def monthly?
    units = frequency.scan(/^[0-9]+/).first
    type = frequency.scan(/[a-z]$/i).first
    type.upcase == 'M'
  end

end