class Blog < ActiveRecord::Base
	acts_as_authorization_object
	has_many :posts
end
