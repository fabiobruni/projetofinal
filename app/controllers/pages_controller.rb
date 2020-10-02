class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :example ]

  def home
  end

  def example
  end
end
