class ResultsController < ApplicationController
# before_action :set_user, only: %i[new create]

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(results_params)
    date = @result.test_date = Date.today
    @result.next_test_date = date + 7
    raise
    if @result.save
      params[@result][:infection_ids].each do |infection_id|
        ResultInfection.Create(
          result: @result,
          infection_id: infection_id
        )
        redirect_to new_result_path(@result), notice: "Result was successfully created."
      end
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

  # def set_user
  #   @user_id = current_user
  # end

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
