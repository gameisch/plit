class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
 

  def create
    @micropost  = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Запостил!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end
  
  def destroy
    @micropost.destroy
    redirect_back_or root_path
 end
  
  def show
   Micropost.find(params[:id]).destroy
   Micropost.paginate :page => params[:page], :per_page => 10
   flash[:alert] = "Пост уничтожен!"
   redirect_back_or root_path 
  end

 

  private

    def authorized_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
end
