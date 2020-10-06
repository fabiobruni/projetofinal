class EvaluationsController < ApplicationController
  def new
    @review = TranslatedText.find(params[:translated_text_id])
    @evaluation = Evaluation.new
  end

  def create
    @review = TranslatedText.find(params[:translated_text_id])
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.translated_text = @review
    @evaluation.user = current_user
    if @evaluation.save
      redirect_to "#", notice: "avaliação salva"
    else
      render "translations/new"
    end
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:content, :stars)
  end
end
