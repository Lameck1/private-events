# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  description :text
#  location    :string
#  schedule    :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :bigint
#
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
