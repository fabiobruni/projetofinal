class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :photo, :is_writer, :cpf])
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end

end
