FactoryBot.define do
  factory :task do
    name { "MyString" }
    description { "MyText" }
    end_time { "2019-11-09 13:43:42" }
    user { nil }
  end
end
