require "test_helper"

feature "check for Zurb" do 
	scenario "check for columns" do
		visit root_path
		page.source.must_include "application.css"
		page.body.must_include "columns"
	end
end
