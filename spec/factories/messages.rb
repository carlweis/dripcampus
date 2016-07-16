FactoryGirl.define do
  factory :message do
    campaign nil
    subject "MyString"
    body "MyText"
    delay 1
    interval "MyString"
  end
end
