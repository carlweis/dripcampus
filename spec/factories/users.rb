FactoryGirl.define do
  factory :user do
    email "demo@example.com"
    password "password"
    password_confirmation "password"
  end
end
