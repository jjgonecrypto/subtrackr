class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username
  field :password
  field :email
  
    
  embeds_many :subscriptions
  
  attr_protected :password
  
  def to_param
    "#{username.parameterize}"
  end
end
