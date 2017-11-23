FactoryBot.define do
  factory :user do
    name { generate :user_name }
    email { generate :email }
    association :tenant
  end
end
