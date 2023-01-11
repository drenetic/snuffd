class ResultsController < ApplicationController
  before_action :authenticate_link, only: %i[share]

  def index
    @results = Result.where(user_id: current_user.id)
  end

  def show
    result = Result.find(params[:id])
    @result = current_user == result.user ? result : "Access Denied"
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

  def results_params
    params.require(:result).permit(
      :user, :doctor, :test_date, :next_test_date
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
