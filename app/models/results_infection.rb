class ResultsInfection < ApplicationRecord
  belongs_to :infection
  belongs_to :result
end
