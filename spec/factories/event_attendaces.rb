# == Schema Information
#
# Table name: event_attendaces
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  attended_event_id :bigint
#  attendee_id       :bigint
#
FactoryBot.define do
  factory :event_attendace do
    attendee_id { "" }
    attended_event_id { "" }
  end
end
