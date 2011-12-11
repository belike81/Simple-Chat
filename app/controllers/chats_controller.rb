class ChatsController < ApplicationController
  before_filter :require_login, :only => [:show, :message]

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
      redirect_to :back, :notice => "Chat has been created successfully"
    else
      @chats = Chat.all
      render :index
    end
  end

  def message
    @chat = Chat.find(params[:id])
    @message = @chat.messages.new(params[:message])

    if @message.save
      redirect_to :back, :notice => "Message added"
    else
      redirect_to :back, :alert => "Couldn't add the message"
    end
  end

end
