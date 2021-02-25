FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }
    location { "MyString" }
    schedule { "2021-02-25 13:46:23" }
    creator_id { "" }
  end
end
