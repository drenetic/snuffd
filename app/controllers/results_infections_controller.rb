class ResultsInfectionsController < ApplicationController

  def show
    @result = Result.find(params[:result_id])
    @result_infection = ResultsInfection.find(params[:id])
    @infection = Infection.find(@result_infection.infection_id)
  end
end
