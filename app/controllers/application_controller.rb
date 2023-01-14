class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # This is supposed to be permitting the custom variables of is_doctor and provider number
  # through to the devise controller so we can assign these variables on sign up - i believe
  # this to be working correctly
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[is_doctor provider_number])
  end
end
