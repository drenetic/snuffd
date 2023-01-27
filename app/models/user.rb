require 'securerandom'
require 'active_support/all'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :generate_secure_code

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :results
  has_one_attached :avatar

  validates :nickname, presence: true, uniqueness: false
  validates :date_of_birth, presence: true
  validate :patient_must_be_of_age

  def patient_must_be_of_age
   aoc = 17.years.ago

    if !date_of_birth.blank? and date_of_birth.after? aoc
      errors.add(:date_of_birth, "must equal age of consent.")
    end
  end


  def article_params
    params.require(:user).permit(avatars: [])
  end

  def generate_secure_code
    begin
      self.secure_code = SecureRandom.random_number(10**8).to_s.rjust(8,'0')
    rescue ActiveRecord::RecordNotUnique
      retry
    end
    self.code_expiration_date = Time.now + 1.day
    self.code_uses_remaining = 1
  end

  def secure_code_expired?
    self.code_expiration_date < Time.now
  end

end
