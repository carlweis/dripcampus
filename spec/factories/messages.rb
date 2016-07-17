FactoryGirl.define do
  factory :message do
    campaign
    subject "Email subject"
    body "Email body"
    delay 1
    interval "days"
  end
end
