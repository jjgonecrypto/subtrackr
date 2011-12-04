class User
  include MongoMapper::Document

  key :username, String
  
  
  many :subscriptions
  
  timestamps!
  
  
  
  def to_param
    "#{username.parameterize}"
  end
end
