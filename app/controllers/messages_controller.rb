class MessagesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def index
    @message = Message.new if signed_in?
    @user = User.find(:all)
    @message = Message.find(params[:all])
    @messages = Message.scoped
    @title = "Мои сообщения"
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new(:parent_id => params[:parent_id])
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to messages_url
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_url
  end
end
