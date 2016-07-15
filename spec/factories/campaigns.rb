FactoryGirl.define do
  factory :campaign do
    user
    sequence(:name) {|n| "Campaign #{n}" }
    tags "signup, new_user"
    description "Signup campaign"
    active true
  end
end
