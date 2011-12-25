class Scheme
  include Mongoid::Document
  
  field :name,      type: String
  field :amount,    type: Float, 	  default: 0
  field :currency,  type: String,   default: "usd" 
  field :frequency, type: String,   default: "monthly"
  field :offset, 	  type: Integer,  default: 0 

  embedded_in :service, inverse_of: :schemes

  validates_numericality_of :offset, greater_than_or_equal_to: 0, less_than_or_equal_to: 31
  validates_numericality_of :amount
  validates_inclusion_of :currency, in: ["usd"] 
  validates_inclusion_of :frequency, in: ["weekly", "monthly", "yearly"]
end