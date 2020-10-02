class ExampleController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
end


