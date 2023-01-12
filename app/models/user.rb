class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :results
  has_one_attached :avatar

  validates :nickname, presence: true, uniqueness: true

  def article_params
    params.require(:user).permit(avatars: [])
  end
end
