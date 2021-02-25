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
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
