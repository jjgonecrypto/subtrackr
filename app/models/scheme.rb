class Scheme
  include MongoMapper::EmbeddedDocument
  
  key :name, String
  key :amount, Float
  key :currency, String
end