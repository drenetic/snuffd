class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV["www.snuffd.com"] || "localhost:3000" }
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[is_doctor provider_number nickname location
                                                         date_of_birth orientation gender first_name last_name])
  end
end
