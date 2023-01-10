class Link < ApplicationRecord
  belongs_to :result

  attribute :expiration_date, :datetime

  def expired?
    expiration_date < Time.now
  end

  def self.valid?(uuid)
    link = Link.find_by(uuid: uuid)
    link && !link.expired?
  end
end
