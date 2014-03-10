require "test_helper"

feature "As a site owner I want to delete a porfolio itme so that i can keep the list focused on my best work" do

  
  scenario "delete a project" do
    name = projects(:portfolio).name
    visit project_path(projects(:portfolio))
    click_on "Destroy"
    page.wont_have_content name
end
end