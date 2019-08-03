class Mailer < ActionMailer::Base
  default from: "migs@miggymigs.com"
  def email(data)
    mail(to: data , subject: "testing email").deliver
  end
end