# == Schema Information
#
# Table name: event_attendances
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  attended_event_id :bigint
#  attendee_id       :bigint
#
class EventAttendance < ApplicationRecord
  scope :get_invitation, lambda { |user_id, event_id|
    where('attendee_id = ? AND attended_event_id == ?', user_id, event_id)
  }

  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
