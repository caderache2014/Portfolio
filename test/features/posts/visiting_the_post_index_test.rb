require "test_helper"

feature "Visiting the Post Index" do 
	scenario "with existing posts, show list" do
		sign_in(:editor)
		#When i visit posts
		visit posts_path

		#load existing posts
		page.text.must_include posts(:cr).title
	end
end

	

