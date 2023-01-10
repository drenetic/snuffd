class ResultsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show generate_link]
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

  def generate_link
    result = Result.find(params[:id])
    link_uuid = SecureRandom.uuid
    expiration_date = Time.now + 5.minutes
    link =
      Link.new(
        uuid: link_uuid,
        result_id: result.id,
        is_active: true,
        expiration_date: expiration_date
      )
    if link.save
      render plain: "#{result_share_url}?uuid=#{link.uuid} created"
    else
      render plain: "Link generation failed"
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
  helper_method :seconds_to_mins
end
