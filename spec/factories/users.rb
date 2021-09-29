FactoryBot.define do
  factory :user do
    sequence(:name)  { |n| "name_#{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { 'password' }
  end
end
