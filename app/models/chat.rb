class Chat < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :messages

  validates :name, :presence => true
  validates :description, :presence => true
end
