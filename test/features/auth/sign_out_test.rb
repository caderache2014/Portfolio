require "test_helper"

feature "As a user I want to be able to sign out from the app" do
  scenario "sign out" do
    sign_up

    click_on "Sign Out"
    page.text.must_include "Signed out successfully"
  end

end