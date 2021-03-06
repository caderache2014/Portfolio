ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment",__FILE__)
require "rails/test_help"
require "minitest/rails/capybara"


class ActiveSupport::TestCase
	fixtures :all

  def sign_up
    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: "logan@example.com" #{}users(:test_user).email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    page.text.must_include("Welcome!")
  end
  def sign_in(role = :editor)
    visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Password", with: "password"
    click_on "Sign in"
  end
end
