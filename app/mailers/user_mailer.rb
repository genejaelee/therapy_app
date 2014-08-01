class UserMailer < ActionMailer::Base
  default from: "plainwhitecouch@gmail.com"
  
  def registration_notification(user)
    @user = user
    mail(to: 'genejaelee@gmail.com', subject: 'User Registered')
    mail(to: 'mattkrisiloff@gmail.com', subject: 'User Registered')
  end
end
