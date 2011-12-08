class Chat < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :messages
end
