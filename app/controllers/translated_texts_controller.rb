class TranslatedTextsController < ApplicationController
    
  def show
    @review = TranslatedText.find(params[:id])
    if Evaluation.all.select { |evaluation| evaluation.translated_text_id == @review.id}.size > 0
      @evaluations = Evaluation.all.select { |evaluation| evaluation.translated_text_id }
    end
  end

  def index
    @translated = TranslatedText.all
  end
end
