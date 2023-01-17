class ResultsController < ApplicationController
before_action :authenticate_link, only: %i[share]

  def new
    @result = Result.new
    @results_infection = ResultsInfection.new
  end

  def submit_forms
    Rails.logger.debug params
  end

  def create
    p "#{params}"

    @result = Result.new(results_params)
    @result.user = current_user
    @result.doctor_id = User.all.where(is_doctor: true).sample.id
    if @result.save
      @results_infection = @result.results_infections.new(results_infection_params)
      @results_infection.start_date = @result.test_date
      @results_infection.save
     redirect_to result_path(@result), notice: "Result was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @results = Result.where(user_id: current_user.id)
  end

  def show
    current_result = Result.find(params[:id])
    if current_user == current_result.user
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
    params.require(:result).permit(:test_date, :next_test_date)
  end

  def results_infection_params
    params.require(:results_infection).permit(:infection_id, :status, :is_treated, :result_id)
  end

  def results_params
    params.require(:result).permit(
      :user_id,
      :doctor_id,
      :test_date,
      :next_test_date
    )
  end

  def results_infections_params
    params.require(:results_infections).permit(
     :user_id,
     :result_id,
     :status,
     :start_date,
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
