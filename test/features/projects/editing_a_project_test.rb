require "test_helper"

feature "As the site owner I want to edit a project so that I can correct typos" do
      scenario "editing an existing project" do
          #visit an existing project
          visit edit_project_path(projects(:portfolio))
          #when I make changes
          fill_in "Name", with: "My Rad Porfolio"
          click_on "Update Project"
          #Then the changes should be saved and shown
          page.text.must_include "success"
          page.text.must_include "Rad Porfolio"
          page.text.wont_include "Code Fellows Porfolio"
      end

      scenario "editing a project incorrectly" do
        visit edit_project_path(projects(:portfolio))
        fill_in "Name", with: "C"
        click_on "Update Project"
        page.text.must_include "prohibited"
        page.text.must_include "Name is too short"
      end
end