class Discussion < ActiveRecord::Base
	acts_as_authorization_object
	has_many :replies
	belongs_to :user
end
