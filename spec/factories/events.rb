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
FactoryBot.define do
  factory :event do
    title { 'Baking' }
    description { "Let's all learn baking basic. We have invited over a pastry chef" }
    location { 'My house' }
    schedule { '2021-02-27 13:46:23' }
    creator_id { create(:user).id }
  end
end
