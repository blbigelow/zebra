class Reply < ActiveRecord::Base
	acts_as_authorization_object
	belongs_to :discussion
	belongs_to :user
	has_many :reply_backs
	has_many :reply_tos, :through => :reply_back
end
