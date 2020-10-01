class SubmittedTextsController < ApplicationController

  # GET /submitted_texts
  def index
    @submitted = SubmittedText.all
  end

end
