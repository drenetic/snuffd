require 'securerandom'
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
