class CommentsController < ApplicationController
before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def new
    @comment = Comment.new(params[:comment])
    @comment.user = @current_user
  end

  def show
    @user = User.find(:all)
    @comment = Comment.find(params[:id])
    @title = "Блог пользователя"
   
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    
  
    if @comment.save
      redirect_to(post_path(params[:post_id]), :notice => 'Комментарий добавлен.')
    else
      redirect_to(post_path(params[:post_id]), :notice => 'Ошибка! Комментарий не создан.')
    end
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

 protected
  
  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    
    redirect_to root_path unless defined?(@parent)
  end
  
  private

    def authorized_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_path if @post.nil?
    end
end



