class ResultsInfection < ApplicationRecord
  belongs_to :infection
  belongs_to :result

  STATUS = ["Detected", "Not Detected"]
end
