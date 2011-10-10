class PostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def edit
    @post = Post.find(params[:id])
    @title = "Редактор блога"
  end
  
  def update
  @post = Post.find(params[:id])
 
  respond_to do |format|
    if @post.update_attributes(params[:post])
      format.html { redirect_to(current_user,
                    :notice => 'Блог успешно изменен.') }
      format.json  { render :json => {}, :status => :ok }
    else
      format.html { render :action => "edit" }
      format.json  { render :json => @post.errors,
                    :status => :unprocessable_entity }
    end
  end
end
  
  def index
    @title = "Создание блога"
    @post = Post.new if signed_in?
  end
  
  def pshow
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page])
    @title = @user.name
  end
  
  def show
    @user = User.find(:all)
    @post = Post.find(params[:id])
    @title = "Блог пользователя"
    @post_title = Post.paginate(:page => params[:all])
    @comments = @post.comments.paginate(:page => params[:page])
  end


  def create
    @post  = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Новый блог создан!"
      redirect_to posts_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
   @post = Post.find(params[:id]).destroy
   @post.destroy
   flash[:alert] = "Блог уничтожен!"
   redirect_back_or current_user
  end
  
 private

    def authorized_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_path if @post.nil?
    end
end
