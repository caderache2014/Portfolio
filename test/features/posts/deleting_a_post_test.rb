require "test_helper"

feature "Deleting a Post" do 
	scenario "post is deleted with a click" do
    sign_in(:editor)
		title = posts(:cr).title
		visit posts_path
		page.find("a[href='#{post_path(posts(:cr))}'][data-method='delete']").click
		page.wont_have_content title		
	end
end