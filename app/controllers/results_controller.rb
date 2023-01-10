class ResultsController < ApplicationController
  before_action :authenticate_link, only: %i[share]

  def index
    #@results = Result.where(user_id: current_user.id)
    @results = Result.all
  end

  def show
    if params[:id]
      @result = Result.find(params[:id])
      if @result
        @results_infections = ResultsInfection.where(result_id: @result.id)
        render "show"
      else
        render plain: "This result doesn't exist."
      end
    else
      render plain: "No ID provided"
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
