class ResultsController < ApplicationController

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(results_params)
    @result.user = current_user
    date = @result.test_date = Date.today
    @result.next_test_date = date + 7
    @result.doctor_id = User.all.where(is_doctor: true).sample.id
    if @result.save
      params[:result][:infection_ids].each do |infection_id|
        ResultsInfection.create(
          result: @result,
          infection_id: infection_id
        )
      end
     redirect_to result_path(@result), notice: "Result was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def results_params
    params.require(:result).permit(
      :user_id,
      :doctor_id,
      :test_date,
      :next_test_date,
      infection_ids: []
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
end
