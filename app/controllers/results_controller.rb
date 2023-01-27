class ResultsController < ApplicationController
  before_action :validate, only: %i[create]
  before_action :authenticate_link, only: %i[share]

  def new
    if current_user.is_doctor
      @infections = Infection.all
    else
      render 'errors/access_denied'
    end
  end

  def confirmation
    current_result = Result.find(params[:id])
    if current_user == current_result.user || current_user == current_result.doctor
      @result = current_result
      @result_infections = ResultsInfection.where(result: @result)
    else
      render 'errors/access_denied'
    end
  end

  def create
    @infections = Infection.all
    @result = Result.new(test_date: params[:test_date], next_test_date: params[:next_test_date])
    @result.user_id = @patient.id
    @result.doctor_id = @doctor.id
    if !params[:infection_ids].present?
      redirect_to new_result_path, notice: "No infections selected"
    elsif @result.save && params[:infection_ids].present?
      params[:infection_ids].each do |infection_id|
        results_infection = @result.results_infections.new(infection_id: infection_id)
        results_infection.start_date = @result.test_date
        results_infection.end_date = results_infection.start_date + Infection.find(infection_id.to_i).duration.days

      if !params[:status].present?
        redirect_to new_result_path, notice: "No infection status is selected"
      else
        params[:status].each do |status|
          items = status.split(" ")
          if infection_id == items[1]
            results_infection.status = items[0]
          end
        end
      end

      if !params[:is_treated].present?
        redirect_to new_result_path, notice: "No treatment status is selected"
      else
        params[:is_treated].each do |is_treated|
          items = is_treated.split(" ")
          if infection_id == items[1]
            results_infection.is_treated = items[0]
          end
        end
      end

        results_infection.save
      end
      redirect_to confirmation_result_path(@result)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    if current_user.is_doctor
      @results = Result.where(doctor_id: current_user.id)
      @patients = @results.map { |result| User.find_by_id(result.user_id) }.uniq
    else
      @results = Result.where(user_id: current_user.id)
    end
  end

  def patient
    @patient = User.find(params[:patient_id])
    @results = Result.where(user_id: params[:patient_id], doctor_id: current_user)
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
    if current_user == @result.user || current_user == @result.doctor
      @result.destroy
        if current_user == @result.user
          redirect_to results_path, notice: 'Result was successfully destroyed.'
        elsif current_user == @result.doctor
          # redirect to the current patients results
        end
    else
      render 'errors/access_denied'
    end
  end

  def share
    link = Link.find_by(uuid: params[:uuid])
    @link = share_results_url+"?uuid="+params[:uuid]
    if link && !link.expired?
      @result = Result.find(link.result_id)
      @results_infections = ResultsInfection.where(result_id: @result.id)
      render "share"
    else
      render plain: "Link is invalid or has expired"
    end
  end

  def validate
    secure_code = params[:secure_code]
    date_of_birth = params[:date_of_birth]
    @patient = User.find_by(secure_code: secure_code, date_of_birth: date_of_birth)
    @doctor = current_user
    if @patient.nil?
      redirect_to new_result_path, notice: "Patient association is invalid."
    else
      create
      @patient.generate_secure_code
      @patient.save
    end
  end

  def generate_token
    @user = current_user
    @user.generate_secure_code
    @user.save
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
end
