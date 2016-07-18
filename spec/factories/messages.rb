FactoryGirl.define do
  factory :message do
    campaign    
    sequence(:subject) {|n| "Email Subject#{n}" }
    body "Email body"
    wait 1
    interval "days"
  end
end
