ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "проект ЛюблюАйТи.рф",
  :user_name            => "Антон Ульянов",
  :password             => "secret",
  :authentication       => "plain",
  :enable_starttls_auto => true
}


