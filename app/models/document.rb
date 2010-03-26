class Document < ActiveRecord::Base
	versioned
	acts_as_authorization_object
	acts_as_taggable_on :tags
	
	
	belongs_to :user
end
