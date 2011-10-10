class PasswordResetsController < ApplicationController
  def new
  end

	def create
	  user = User.find_by_email(params[:email])
	  user.send_password_reset if user.save
	  redirect_to root_url, :notice => "На Ваш email выслано письмо с инструкцией"
	end

	def edit
	  @user = User.find_by_password_reset_token!(params[:id])
	end

	def update
	  @user = User.find_by_password_reset_token!(params[:id])
	  if @user.password_reset_sent_at < 10.minutes.ago
	    redirect_to new_password_reset_path, :alert => "Сброс пароля истек."
	  elsif @user.update_attributes(params[:user])
	    redirect_to root_url, :notice => "Пароль сброшен!"
	  else
	    render :edit
	  end
	end
end
