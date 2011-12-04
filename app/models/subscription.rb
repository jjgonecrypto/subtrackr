class Subscription
 include Mongoid::Document
  
  field :service, type: String
  
  embedded_in :user
end