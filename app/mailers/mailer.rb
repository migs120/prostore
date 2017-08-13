class Mailer < ActionMailer::Base
  default from: "migs@miggymigs.com"
  def email(data)
    mail(to: "migs910@hotmail.com", subject: "testing email").deliver
  end
end