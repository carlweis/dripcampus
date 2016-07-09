FactoryGirl.define do
  factory :user do
    name "demo"
    email "demo@example.com"
    password "password"
    password_confirmation "password"
  end
end
