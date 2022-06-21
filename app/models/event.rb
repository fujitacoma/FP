class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :user
  has_one_attached :image
  has_many :comments

  with_options presence: true do
    validates :image, :event_name, :content, :date, :user_id
  end
  validates :prefecture_id,      numericality: { other_than: 1, message: "can't be blank" }


end
