class TranslatedTextsController < ApplicationController
  before_action :set_submitted, only: [:new, :create]

  def index
    @translated = TranslatedText.all
  end


  def new
    @translated = TranslatedText.new
  end

  def create
    @translated = TranslatedText.new(translated_params)
    @translated.service_title = @submitted

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
    @submitted = SubmittedText.find(params[:id])
  end

  def translated_params
    params.require(:translated_text).permit(:url, :institution, :deadline, :service_title, :service, :target_public, :service_stages, :more_info)
  end

end
