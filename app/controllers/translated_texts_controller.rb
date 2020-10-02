class TranslatedTextsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_submitted, only: [:new, :create]

  def index
    @translated = TranslatedText.all
  end


  def new
    @translated = TranslatedText.new
  end

  def create
    @translated = TranslatedText.new(translated_params)
    @translated.submitted_text = @submitted
    @translated.user = current_user
 

    if @translated.save
      redirect_to submitted_text_path(@submitted)
    else
      render :new
    end
  end
  
  def show
    @review = TranslatedText.find(params[:id])
    @evaluation = Evaluation.new
    if Evaluation.all.select { |evaluation| evaluation.translated_text_id == @review.id}.size > 0
      @evaluations = Evaluation.all.select { |evaluation| evaluation.translated_text_id }
    end
    @original = SubmittedText.find(@review.submitted_text_id)
  end

 

  private
  def set_submitted
    @submitted = SubmittedText.find(params[:submitted_text_id])
  end

  def translated_params
    params.require(:translated_text).permit(:service_title, :service, :target_public, :service_stages, :more_info)
  end

end
