require 'spec_helper'

describe Chat do
  describe "#new" do
    it "should create a new chat object with given name" do
      chat = Chat.new('Chat name')
      chat.should be_an_instance_of(Chat)
    end
  end
end
