class UserMailer < ApplicationMailer
  default from: "tafeltest@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def welcome_mail(user)
    @user = user
    @tafel = Tafel.find(user.tafel_id)
    mail(to: user.email , subject: "Account Tafel")
  end

  def activation_needed_email(user)
    @user = user
    @tafel = Tafel.find(user.tafel_id)
    @url = "http://0.0.0.0:3000/users/#{user.activation_token}/activate"
    mail(to: user.email , subject: "Account Tafel")
  end

  def activation_success_email(user)
  end
end
