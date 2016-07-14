FactoryGirl.define do
  factory :campaign do
    user create(:user)
    name "New User Signup Campaign"
    tags "signup, new_user"
    active true
  end
end
