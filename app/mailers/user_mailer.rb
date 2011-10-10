class UserMailer < ActionMailer::Base
  default :from => "gameisch@mail.com"
  
  def registration_confirmation(user)
    recipients  user.email
    from        "gameisch@mail.ru"
    subject     "Спасибо, что Вы присоединились к нам!"
    body        :user => user
    attachments["logo.png"] = File.read("#{Rails.root}/public/images/logo.png")
    
  end
  
	def password_reset(user)
	  @user = user
	  mail :to => user.email, :subject => "Сброс пароля!"
	end
  
  def welcome_email(user)
    @user = user
    @url  = "http://люблюАйТи.рф/"
    mail(:to => user.email,
         :subject => "Добро пожаловать!")
  end

end
