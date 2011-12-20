class Scheme
  include Mongoid::Document
  
  field :name,      :type => String
  field :amount,    :type => Float, 	default: 0
  field :currency,  :type => String, 	default: "usd" 
  field :frequency, :type => String, 	default: "monthly"
  field :offset, 	type: Integer, 		default: 0 #0 means on day of creation

  embedded_in :service, inverse_of: :schemes
end