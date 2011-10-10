class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  
  def index
    @title = "Все пользователи"
    @users = User.paginate(:page => params[:page])
    
    
 if params[:search]
    @title = "Поиск"
    @users = User.search(params[:search])
    
    render 'sindex'
    end
  end

  def show
  
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
    @comments = @user.comments.paginate(:page => params[:page])
  end
  
  
  
  def create
    @user = User.new(params[:user])
      if @user.save
      #UserMailer.registration_confirmation(@user).deliver
       sign_in @user
       flash[:success] = "Добро пожаловать на ЛюблюАйТи.рф!"
       redirect_to @user
      # Handle a successful save.
      else
      @title = "Регистрация"
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Профиль уничтожен!"
    redirect_to users_path if @user.nil?
  end
  
  
  
  def new
    @user = User.new
    @title = "Регистрация"
  end
  

  
  def following
    @title = "Любимые:"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
# if current_user.following?(@user) 
  # render 'unfollow' 
 # end
end

  def followers
    @title = "Любят:"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end
   
  def edit
    @title = "Редактирование профиля"
   
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Профиль обновлен!"
      redirect_to @user
    else
      @title = "Изменения профиля"
      render 'edit'
    end
  end

  

  private

    

   def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
   
   def admin_user
      redirect_to(root_path) unless current_user.admin?
   end
end

