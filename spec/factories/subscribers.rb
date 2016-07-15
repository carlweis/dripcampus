FactoryGirl.define do
  factory :subscriber do
    campaign nil
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    source "MyString"
    sends 1
    opens 1
    replies 1
    clicks 1
    opt_out false
  end
end
