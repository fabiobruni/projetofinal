class SubmittedTextsController < ApplicationController

  # GET /submitted_texts
  def index
    @submitted_texts = SubmittedText.all
  end

end
