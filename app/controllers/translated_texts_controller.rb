class TranslatedTextsController < ApplicationController
    
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
end
