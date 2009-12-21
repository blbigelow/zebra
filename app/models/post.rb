class Post < ActiveRecord::Base
	versioned
	acts_as_authorization_object
	belongs_to :user
	belongs_to :blog
end
