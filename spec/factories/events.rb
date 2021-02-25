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
    title { "MyString" }
    description { "MyText" }
    location { "MyString" }
    schedule { "2021-02-25 13:46:23" }
    creator_id { "" }
  end
end
