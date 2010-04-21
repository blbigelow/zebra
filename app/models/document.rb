class Document < ActiveRecord::Base
	versioned
	acts_as_authorization_object
	acts_as_taggable_on :tags
	
	belongs_to :user
	
	searchable do
		text :title, :boost => 2.0
		text :content
		text :tags
	end
end
