class ChatsController < ApplicationController

  def index
    @chat = Chat.new
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def create
    @chat = Chat.new(params[:chat])
    if @chat.save
      redirect_to :back, :flash => { :success => "Chat has been created successfully" }
    else
      index
    end
  end

  def message
    @chat = Chat.find(params[:id])
    @message = @chat.messages.new(params[:message])

    if @message.save
      redirect_to :back, :flash => { :success => "Message added" }
    else
      redirect_to :back, :flash => { :failure => "Couldn't add the message"}
    end
  end

end
