class Post < ActiveRecord::Base
	acts_as_authorization_object
	acts_as_taggable_on :tags
	
	belongs_to :user
	belongs_to :blog
end
