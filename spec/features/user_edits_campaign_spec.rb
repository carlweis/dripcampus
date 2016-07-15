require "rails_helper"

feature "user edits campaign" do
  scenario "with valid attributes" do
    # login
    user = FactoryGirl.create(:user)
    user.confirm

    visit new_user_session_path
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
    expect(page).to have_content("Dashboard")

    # edit existing campaign
    campaign = FactoryGirl.create(:campaign, user: user)
    visit edit_campaign_path(campaign)
    fill_in "campaign_name", with: "new user signup"
    click_button "Update Campaign"
    expect(page).to have_content(
      "Drip Campagin new user signup has been updated."
    )
  end
end
