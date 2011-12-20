class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Mongoid::Timestamps

  field :username
  field :password
  field :email
  #field :name
  
  validates_presence_of :username
  validates_uniqueness_of :username, :email, :case_sensitive => false
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  
  has_many :subscriptions, :dependent => :delete
  
  #attr_protected :password
  
  #def to_param "#{username.parameterize}" end
end
