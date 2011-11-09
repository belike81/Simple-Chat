require 'spec_helper'

describe ChatsController do
  render_views

  before(:each) do
    @chat = Chat.create(:name => "Ruby chat")
  end

  describe "GET 'index'" do
    before(:each) do
      visit chats_path
    end

    it "returns http success" do
      response.should be_success
    end

    it "should display a list of available chats to choose from" do
      page.should have_selector('ul.chats_list a', :href => chat_path(@chat))
    end

    it "should have a form to create a new chat" do
      page.should have_selector('input#chat_name')
    end
  end

  describe "GET 'show'" do
    before(:each) do
      visit chat_path(@chat)
    end

    it "returns http success" do
      response.should be_success
    end

    describe "visible elements" do
      it "should have a main text input box" do
        page.should have_selector('input#message_text', :type => "text")
      end

      it "should have a user name text input box" do
        page.should have_selector('input#message_user_name', :type => "text")
      end

      it "should have a visible title element" do
        page.should have_selector('h1')
      end

      it "should have a correct title" do
        page.should have_selector('title', :content => "SimpleChat")
      end

      it "should have a main chat window" do
        page.should have_selector('div.chat_window')
      end
    end
  end

  describe "POST 'create'" do
    it "should create a new chat" do
      lambda do
        @attr = { :name => "New chat" }
        request.env["HTTP_REFERER"] = chats_path
        post :create, :chat => @attr
      end.should change(Chat, :count).by(1)
    end
  end

  describe "POST 'message'" do
    it "should create a new message for the specified chat" do
      lambda do
        @attr = { :text => "Foo", :user_name => "Bar"}
        request.env["HTTP_REFERER"] = chat_path(@chat)
        post :message, :id => @chat, :message => @attr
      end.should change(@chat.messages, :count).by(1)
    end
  end

end
