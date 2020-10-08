class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :example]

  def home
  end

  def example
  end

  def mypage
    @mysubmitted = SubmittedText.all.select { |submitted| submitted.user_id == current_user.id }
    @mytranslated = TranslatedText.all.select { |translated| translated.user_id == current_user.id}
    @myposted = @mytranslated.reject { |post| post.draft == true }
    @mydraft = @mytranslated.select { |post| post.draft == true }
    @accepted = @myposted.select { |text| text.choosen_translat == true }
    @posted = @myposted - @accepted
    @mytranslated = @mydraft + @posted + @accepted
  end

  def accept
    @review = TranslatedText.find(params[:id])
    @original = SubmittedText.find(@review.submitted_text_id)
  end

  def confirm
    accept
    @original.service_title = @review.service_title
    @original.service = @review.service
    @original.target_public = @review.target_public
    @original.service_stages = @review.service_stages
    @original.more_info = @review.more_info
    @review.choosen_translat = true
    @review.save
    @original.save
    redirect_to submitted_text_path(@original), notice: 'A sugestão foi incorporada ao seu texto.'
  end
end
