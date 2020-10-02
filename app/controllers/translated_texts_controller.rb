class TranslatedTextsController < ApplicationController
  before_action :set_translated, only: [:destroy]

  def show
    @review = TranslatedText.find(params[:id])
    @evaluation = Evaluation.new
    if Evaluation.all.select { |evaluation| evaluation.translated_text_id == @review.id}.size > 0
      @evaluations = Evaluation.all.select { |evaluation| evaluation.translated_text_id }
    end
    @original = SubmittedText.find(@review.submitted_text_id)
  end

  def index
    @translated = TranslatedText.all
  end

  def destroy
    @translated.destroy
    redirect_to translated_texts, notice: 'Pronto, sua sugestão de tradução foi apagada.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_translated
    @translated = TranslatedText.find(params[:id])
  end

  def translated_params
    params.require(:translated_text).permit(:url, :institution, :choosen_translat, :service_title, :service, :target_public, :service_stages, :more_info)
  end




end
