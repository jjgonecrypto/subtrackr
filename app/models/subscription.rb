class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :service, :type => String
  field :frequency
  
  embedded_in :user
  
  def monthly?
    type.upcase == 'M'
  end
  
  def daily?
    type.upcase == 'D'
  end

  def weekly?
    type.upcase == 'W'
  end

  private
  def type
    @type ||= frequency.scan(/[a-z]$/i).first
  end

  private
  def units
    @units ||= frequency.scan(/^[0-9]+/).first
  end

end