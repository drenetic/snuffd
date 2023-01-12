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
