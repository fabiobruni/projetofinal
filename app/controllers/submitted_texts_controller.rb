class SubmittedTextsController < ApplicationController
   skip_before_action :authenticate_user!, only: :show
  # GET /submitted_texts
  def index
    @submitted = SubmittedText.all
  end

  def new
    @submitted = SubmittedText.new
  end








  def show
    @text = SubmittedText.find(params[:id])
    if TranslatedText.all.select { |translation| translation.submitted_text_id == @text.id}.size > 0
      @reviews = TranslatedText.all.select { |translation| translation.submitted_text_id }
    end
  end
end
