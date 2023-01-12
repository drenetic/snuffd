class LinksController < ApplicationController
  before_action :authenticate_user!, only: %i[index create]

  def index
    @results = Result.all
    @links = Link.where(result_id: @results.ids)
  end

  def create
    result = Result.find(params[:result_id])
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
      render plain: "#{share_results_url}?uuid=#{link.uuid} created"
    else
      render plain: "Link generation failed"
    end
  end
end
