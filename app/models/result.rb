class Result < ApplicationRecord
  belongs_to :user
  belongs_to :doctor, class_name: 'User'
  has_many :links, dependent: :destroy
  has_many :results_infections, dependent: :destroy
end
