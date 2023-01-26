class LinksController < ApplicationController
  before_action :authenticate_user!, only: %i[index create]

  def index
    results = Result.where(user_id: current_user.id)
    all_links = Link.where(result_id: results.ids)
    current_links = []
    all_links.each do |link|
      if link.expiration_date > Time.now
        current_links.push(link)
      end
    end
    @links = current_links
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
      redirect_to share_results_url+"?uuid="+link.uuid
    else
      render plain: "Link generation failed"
    end
  end
end
