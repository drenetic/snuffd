class LinksController < ApplicationController
  def show
    @results = Result.where(user_id: current_user.id)
    @links = Link.where(result_id: @results.ids)
  end
end
