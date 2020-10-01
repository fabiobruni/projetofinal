class SubmittedTextsController < ApplicationController
<<<<<<< HEAD
   skip_before_action :authenticate_user!, only: :show

  def show
    @text = SubmittedText.find(params[:id])
    if TranslatedText.all.select { |translation| translation.submitted_text_id == @text.id}.size > 0
      @reviews = TranslatedText.all.select { |translation| translation.submitted_text_id }
    end
  end
=======

  # GET /submitted_texts
  def index
    @submitted = SubmittedText.all
  end

>>>>>>> 16124ed47f9ca6a466c5d414a1c8671c44faa30c
end
