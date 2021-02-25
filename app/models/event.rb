class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :schedule, presence: true
  validates :description, presence: true, length: { maximum: 100 }

  belongs_to :creator, class_name: 'User'

  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances

  scope :past_events, -> { where('schedule < ?', Date.today) }
  scope :upcoming_events, -> { where('schedule >= ?', Date.today) }
  
end
