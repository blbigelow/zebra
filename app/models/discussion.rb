class Discussion < ActiveRecord::Base
	acts_as_authorization_object
	acts_as_taggable_on :tags
	
	has_many :replies
	belongs_to :user
end
