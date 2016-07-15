FactoryGirl.define do
  factory :campaign do
    user
    name "New User Signup Campaign"
    tags "signup, new_user"
    description "Signup campaign"
    active true
  end
end
