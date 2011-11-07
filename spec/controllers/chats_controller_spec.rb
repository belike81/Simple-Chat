require 'spec_helper'

describe ChatsController do
  render_views

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    describe "visible elements" do
      it "should have a main text input box" do
        get :index
        response.should have_selector('input#chat_text', :type => "text")
      end

      it "should have a user name text input box" do
        get :index
        response.should have_selector('form input#chat_user_name')
      end
    end
  end

end
