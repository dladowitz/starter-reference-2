class ApplicationMailer < ActionMailer::Base
  default(from: "dusty@littlecatlabs.co")

  layout "mailer"
end
