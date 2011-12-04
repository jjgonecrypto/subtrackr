class Service
  include Mongoid::Document
  
  field :name, type: String
  
  embed_many :schemes
  
end