require "rails_helper"

feature "user creates campaign" do
  scenario "with valid attributes" do
    # login
    user = FactoryGirl.create(:user)
    user.confirm

    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
    expect(page).to have_content("New Campaign")

    # create a new campaign
    click_on "New Campaign"

    fill_in "campaign_name", with: "user signup"
    fill_in "campaign_description", with: "new user signup campaign"
    fill_in "campaign_tags", with: "signup, new_user"

    click_button "Create Campaign"

    expect(page).to have_content(
      "Drip Campaign user signup successfully created."
    )
  end
end
