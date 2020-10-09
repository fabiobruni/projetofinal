class TranslatedTextsController < ApplicationController
  before_action :set_translated, only: [:destroy]
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
      redirect_to edit_submitted_text_translated_text_path(@submitted, @translated), notice: 'Texto salvo com sucesso.'
    else
      render :new
    end
  end

  def edit
    @review = TranslatedText.find(params[:id])
    @original = @review.submitted_text
  end

  def update
    set_translated
    @review.update(translated_params)
    redirect_to submitted_text_translated_text_path(@review), notice: "Sugestão alterada com sucesso"
  end

  def show
    @review = TranslatedText.find(params[:id])
    @original = SubmittedText.find(@review.submitted_text_id)
  end

  def destroy
    @review.destroy
    redirect_to "#", notice: 'Pronto, sua sugestão de tradução foi apagada.'
  end

  private
  def set_submitted
    @submitted = SubmittedText.find(params[:submitted_text_id])
  end

  def translated_params
    params.require(:translated_text).permit(:service_title, :service, :target_public, :service_stages, :more_info, :draft)
  end

   def set_translated
    @review = TranslatedText.find(params[:id])
  end

 end
