require 'rails_helper'

feature "user creates subscriber" do
  scenario "with valid attributes" do
    # login
    user = FactoryGirl.create(:user)
    user.confirm

    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
    expect(page).to have_content("Dashboard")

    campaign = FactoryGirl.create(:campaign, user: user)

    visit new_campaign_subscriber_path(campaign)

    # add subscriber to campaign
    fill_in "subscriber_email", with: "demo@example.com"
    fill_in "subscriber_first_name", with: "Stan"
    fill_in "subscriber_last_name", with: "Smith"
    fill_in "subscriber_source", with: "http://example.com"

    click_button "Create Subscriber"

    expect(page).to have_content(
      "Subscriber demo@example.com successfully created."
    )
  end
end
