class UserMailer < ApplicationMailer
  def registration_email(registration)
    @registration = registration
    attachments.inline['logo_handwriting.png'] = File.read('app/assets/images/logo_handwriting.png')

    mail(to: @registration.email, subject: "Little Cat Labs - Registration")
  end
end
