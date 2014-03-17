require "test_helper"

feature "Editing a Post" do 
	scenario "submit updates to an existing post" do
		
    sign_in
    visit posts_path(posts(:cr))
		first(:link, 'Edit').click
		fill_in "Title", with: "Becoming a Web Developer"
		click_on "Update Post"
		page.text.must_include "Post was successfully updated"
		page.text.must_include "Web Developer"
	end
end
