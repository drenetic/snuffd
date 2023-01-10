class ResultsController < ApplicationController

  def index
    @results = Result.where(user_id: current_user.id)
  end

  def show
    result = Result.find(params[:id])
    @result = current_user == result.user ? result : "Access Denied"
  end

  private

  def results_params
    params.require(:result).permit(
      :user, :doctor, :test_date, :next_test_date
    )
  end

end
