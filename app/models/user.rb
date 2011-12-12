class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username
  field :password
  field :email
  
  has_many :subscriptions, :dependent => :delete
  
  attr_protected :password
  
  def to_param
    "#{username.parameterize}"
  end
end
