class Service
  include Mongoid::Document
  
  field :name
  
  embed_many :schemes
  
end