class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_adoption.subject
  #
  def new_adoption(translated)
    @user = translated.submitted_text.user
    mail(to: translated.submitted_text.user.email, subject: 'Seu texto foi adotado!')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_translation.subject
  #
  def new_translation
    @users = User.where(is_writer: false)
    @users.each do |user|
     mail(to: user.email, subject: 'Novo texto disponível')
  end
end
