class Event < ApplicationRecord
  default_scope { order(start_time: :asc) }
  scope :past_events, -> { where('date < ?', Date.current) }
  scope :future_events, -> { where('date > ?', Date.current) }

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances

  validates :title, presence: true, length: { minimum: 6, maximum: 140 }
  validates :description, presence: true, length: { minimum: 20, maximum: 1500 }
  validates :date, presence: true
  validates :location, presence: true
end