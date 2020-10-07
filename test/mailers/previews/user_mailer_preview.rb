# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_adoption
  def new_adoption
    UserMailer.new_adoption
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_translation
  def new_translation
    UserMailer.new_translation
  end

end
