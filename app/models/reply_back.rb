class ReplyBack < ActiveRecord::Base
	belongs_to :reply
	belongs_to :reply_to, :class_name => "Reply"
end
