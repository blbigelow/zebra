class Document < ActiveRecord::Base
	acts_as_authorization_object
	
	belongs_to :user
end
