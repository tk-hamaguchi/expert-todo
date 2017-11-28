require 'faker'

FactoryBot.define do
  sequence :tenant_name do |n|
    Faker::Company.name
  end

  sequence :user_name do |n|
    Faker::Name.name
  end

  sequence :email do |n|
    Faker::Internet.email
  end
end
