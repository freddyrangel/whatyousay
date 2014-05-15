FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}test@example.com" }
    sequence(:user_name) { |n| "#{n}username" }
  end
end

