class Service
  include Mongoid::Document
  
  field :name
  
  embeds_many :schemes
  
end