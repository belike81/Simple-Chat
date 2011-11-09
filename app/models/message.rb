class Message < ActiveRecord::Base
  attr_accessible :user_name, :text

  belongs_to :chat
end
