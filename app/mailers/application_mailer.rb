class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@railing.com',
          return_path: 'contact@railing.com'

  layout 'mailer'

  def email(to_address, subject, body)
    options = { to: to_address, subject: subject, body: body }
    mail options
  end
end
