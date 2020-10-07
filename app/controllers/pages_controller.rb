class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :example ]

  def home
  end

  def example
  end

  def mypage
    @mysubmitted = SubmittedText.all.select { |submitted| submitted.user_id == current_user.id }
    @mytranslated = TranslatedText.all.select { |translated| translated.user_id == current_user.id}
    @myposted = @mytranslated.reject { |post| post.draft == true }
    @mydraft = @mytranslated.select { |post| post.draft == true }
    @accepted = @mytranslated.select { |text| text.choosen_translat == true }
  end
end
