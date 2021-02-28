# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { maximum: 10 }
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  has_many :event_attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendances
end
