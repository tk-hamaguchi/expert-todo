FactoryBot.define do
  sequence :tenant_name { Faker::Company.name }
  sequence :user_name { Faker::Name.name }
  sequence :email { Faker::Internet.email }
end
