class Service
  include MongoMapper::Document
  
  key :name, String
  timestamps!
  
  many :schemes
  
end