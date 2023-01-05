class Infection < ApplicationRecord
  has_many :results_infections
  has_many :results, through: :results_infections
end
