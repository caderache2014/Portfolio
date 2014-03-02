require "test_helper"

feature "land on home page" do
	scenario "contains info" do
		visit root_path
		assert page.has_content?("Welcome aboard")
	end
end