class User < ActiveRecord::Base
	acts_as_tagger
	acts_as_authentic
	acts_as_authorization_subject
	
	has_many :blogs
	has_many :posts
	has_many :discussions
	has_many :replies
	has_many :documents
	
	def name
		self.email
	end
end
