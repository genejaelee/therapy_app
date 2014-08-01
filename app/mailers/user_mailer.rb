class UserMailer < ActionMailer::Base
  default from: "plainwhitecouch@gmail.com"
  
  def registration_notification(user)
    admins = ['genejaelee@gmail.com', 'mattkrisiloff@gmail.com']
    @user = user
    mail(to: admins, subject: 'User Registered')
  end
  
  def charge_notification(user, amount)
    admins = ['genejaelee@gmail.com', 'mattkrisiloff@gmail.com']
    @amount = amount
    @user = user
    mail(to: admins, subject: "User Charged #{@amount}")
  end
end
