class Service
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
    
  field :name,      type: String
  field :url,       type: String
  field :desc,      type: String
  field :category,  type: String
  
  embeds_many :schemes

  accepts_nested_attributes_for :schemes, allow_destroy: true
  has_mongoid_attached_file :logo,  
  		styles: 
  		{ 
	  		medium: "250x250>", 
	  		small: 	"100x100>",
	  		teeny:  "32x32>", 
	  		tiny:   "16x16>" 
	  	}
end
