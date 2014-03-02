require "test_helper"

feature "Creating a Post" do 
	scenario "submit form data to create a new post" do
		visit new_post_path
		fill_in "Title", with: posts(:cr).title
		fill_in "Body", with: posts(:cr).body
		click_on "Create Post"
		page.text.must_include "Post was successfully created"
		page.text.must_include posts(:cr).title
	end		
end
