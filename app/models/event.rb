class Event < ApplicationRecord

  validates :nickname, presence: true

  belongs_to :user
  has_one_attached :image

end
