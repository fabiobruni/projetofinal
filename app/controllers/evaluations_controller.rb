class EvaluationsController < ApplicationController
before_action :set_translated_text, only: [:new, :create]

def new
  @evaluation = Evaluation.new
end

def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.translated_text = @evaluation

    if @evaluation.save
      redirect_to evaluation_path(@evaluation)
    else
      render :new
    end
  end


  private

  def set_translated_text
    @translated_text = TranslatedText.find(params[:translated_text_id])
  end


  def evaluation_params
    params.require(:evaluation).permit(:content, :stars, :user_id, :translated_text_id)
  end

end
