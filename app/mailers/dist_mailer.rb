class DistMailer < ApplicationMailer
  def spam_mail(title, body, email)
    @body = body
    mail(to: email, subject: "#{title}")
  end
end