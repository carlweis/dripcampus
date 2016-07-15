require 'ffaker'

FactoryGirl.define do
  factory :subscriber do
    campaign
    email FFaker::Internet.email
    first_name FFaker::Name.first_name
    last_name FFaker::Name.last_name
    source "website"
    sends 1
    opens 1
    replies 1
    clicks 1
    opt_out false
  end
end
