class SubmittedTextsController < ApplicationController
 
  before_action :set_submitted, only: [:destroy]

  skip_before_action :authenticate_user!, only: :show

  # GET /submitted_texts
  def index
    @submitted = SubmittedText.all
  end

  def new
    @submitted = SubmittedText.new
  end

  def create
    @submitted = SubmittedText.new(submitted_params)
    @submitted.user_id = current_user.id
    @submitted.save
    if @submitted.save
      redirect_to submitted_texts_path(@submitted)
    else
      render :new
    end
  end


  def show
    @text = SubmittedText.find(params[:id])
    if TranslatedText.all.select { |translation| translation.submitted_text_id == @text.id}.size > 0
      @reviews = TranslatedText.all.select { |translation| translation.submitted_text_id }
    end
  end


  # DELETE /submitted_texts/1
  def destroy
    @submitted.destroy
    redirect_to submitted_texts_url, notice: 'Pronto, seu texto foi apagado.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  
  def set_submitted
    @submitted = Submitted.find(params[:id])
  end

  def submitted_params
    params.require(:submitted_text).permit(:url, :institution, :deadline, :service_title, :service, :target_public, :service_stages, :more_info)
  end

end
