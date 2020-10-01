class SubmittedTextsController < ApplicationController
  before_action :set_text, only: [:destroy]
   
  skip_before_action :authenticate_user!, only: :show
 
  # GET /submitted_texts
  def index
    @submitted = SubmittedText.all
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
  def set_text
    @submitted = SubmittedText.find(params[:id])
  end

end
