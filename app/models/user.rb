class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'


  validates :nickname, presence: true

  has_many :events
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :favcom_events, through: [:favorites, :comments], source: :event

  def favorite_by?(event_id)
    favorites.where(event_id: event_id).exists?
  end

end
