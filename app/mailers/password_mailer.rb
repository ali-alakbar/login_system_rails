class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #


  # This files act like a controller to generates HTML/texts for your EMAIL. 
  def reset
    # When we recieve an email, when we click on it, it will redirect me to a page associated with this "@token"
    user = params[:user]
    @token = user.signed_id(purpose: "password_reset", expires_in: 15.minutes)
    mail to: user.email
  end
end
