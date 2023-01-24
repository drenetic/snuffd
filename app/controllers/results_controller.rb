class ResultsController < ApplicationController
before_action :authenticate_link, only: %i[share]
before_action :validate_secure_code, only: %i[create]

  def new
    @infections = Infection.all
  end

  def submit_forms
    Rails.logger.debug params
  end

  def create
    p "#{params}"
    @infections = Infection.all
    @result = Result.new(test_date: params[:test_date], next_test_date: params[:test_date])
    @result.user_id = @patient.id
    @result.doctor_id = @doctor.id
    if @result.save && !@infections.nil?
      params[:infection_ids].each do |infection_id|
        results_infection = @result.results_infections.new(infection_id: infection_id)

        params[:status].each do |status|
          items = status.split(" ")
          if infection_id == items[1]
            results_infection.status = items[0]
          end
        end

        params[:is_treated].each do |is_treated|
          items = is_treated.split(" ")
          if infection_id == items[1]
            results_infection.is_treated = items[0]
          end
        end

        results_infection.save
      end
      redirect_to result_path(@result), notice: "Result was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    if current_user.is_doctor == true
      @results = Result.where(doctor_id: current_user)
      @patients = @results.map { |result| User.find_by_id(result.user_id) }.uniq
    else
      @results = Result.where(user_id: current_user.id)
    end
  end

  def patients
    @results = Result.where(user_id: params[:id], doctor_id: current_user)
    @patient = User.find(params[:id])
  end

  def show
    current_result = Result.find(params[:id])
    if current_user == current_result.user || current_user == current_result.doctor
      @result = current_result
    else
      render 'errors/access_denied'
    end
  end

  def destroy
    @result = Result.find(params[:id])
    if current_user == @result.user
      @result.destroy
      redirect_to results_path, notice: 'Result was successfully destroyed.'
    else
      render 'errors/access_denied'
    end
  end

  def share
    link = Link.find_by(uuid: params[:uuid])

    if link && !link.expired?
      @result = Result.find(link.result_id)
      @results_infections = ResultsInfection.where(result_id: @result.id)
      render "share"
    else
      render plain: "Link is invalid or has expired"
    end
  end

  private

  def result_params
    params.require(:result).permit(:test_date, :next_test_date, :user_id, :doctor_id, :date_of_birth)
  end

  def results_infections_params
    params.require(:results_infections).permit(
     :infection_id,
     :result_id,
     :status,
     :start_date,
     :is_treated,
     :end_date
    )
  end

  def authenticate_link
    link = Link.find_by(uuid: params[:uuid])
    if link
      if link.expired?
        link.update(is_active: false)
        render plain: "Link has expired"
      else
      end
    else
      render plain: "Invalid link"
    end
  end

  def validate_secure_code
    secure_code = params[:secure_code]
    date_of_birth = params[:date_of_birth]
    @patient = User.find_by(secure_code: secure_code, date_of_birth: date_of_birth)
    @doctor = current_user
    if @patient.nil? || @patient.secure_code_expired?
      redirect_to new_result_path, notice: "Patient association is invalid."
    else
      # @patient.generate_secure_code
      @patient.save
    end
  end

end
