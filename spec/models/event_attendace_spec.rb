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
require 'rails_helper'

RSpec.describe EventAttendace, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
