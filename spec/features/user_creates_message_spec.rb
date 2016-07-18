require 'rails_helper'

feature "user creates message" do
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

    visit new_campaign_message_path(campaign)

    # add subscriber to campaign
    fill_in "message_subject", with: "test subject"
    fill_in "message_body", with: "<p>Message body</p>"
    fill_in "message_wait", with: 10
    select "minutes", from: "message_interval"

    click_button "Create Message"

    expect(page).to have_content(
      "Campaign Message successfully created"
    )
  end
end
