class User
  include Mongoid::Document

  field :username
  
  
  embeds_many :subscriptions
  
  
  
  
  def to_param
    "#{username.parameterize}"
  end
end
