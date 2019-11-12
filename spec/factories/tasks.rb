FactoryBot.define do
  factory :task do
    name { FFaker::NameBR.unique.name }
    description { FFaker::Lorem.unique.phrase }
    end_time { Date.today }
    trait :with_user do
      user_id { create(:user).id }
    end
    trait :to_do do
      status { 0 }
    end
    trait :doing do
      status { 1 }
    end
    trait :done do
      status { 2 }
    end
  end
end