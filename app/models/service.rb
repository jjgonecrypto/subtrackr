class Service
  include Mongoid::Document
  include Mongoid::Timestamps
   
  field :name, :type => String
  field :url, :type => String
  field :desc, :type => String
  field :category, :type => String
  
  embeds_many :schemes
end
