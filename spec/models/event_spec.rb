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
require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
