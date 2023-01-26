class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_patient

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[is_doctor provider_number nickname location
                                                         date_of_birth orientation gender first_name last_name])
  end

  def set_patient
    secure_code = params[:secure_code]
    date_of_birth = params[:date_of_birth]
    @patient = User.find_by(secure_code: secure_code, date_of_birth: date_of_birth)
  end
end
