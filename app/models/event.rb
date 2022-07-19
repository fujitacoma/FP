class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :image, :event_name, :content, :date, :user_id
  end
  validates :prefecture_id,      numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image
  has_many :users, through: [:favorites, :comments]
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.search(search)
    if search != ""
      Event.where(["event_name like?", "%#{search}%"])
    else
      Event.all
    end
  end

end
