class Subscription
  include MongoMapper::EmbeddedDocument
  
  key :service, String
end