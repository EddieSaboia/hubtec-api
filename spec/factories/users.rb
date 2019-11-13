FactoryBot.define do
  factory :user do
    email { FFaker::Internet.unique.email }
    
    password_value = FFaker::Internet.unique.password
    password { password_value }
    password_confirmation { password_value }
  end
end