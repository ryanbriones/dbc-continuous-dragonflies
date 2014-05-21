require "spec_helper"

feature "User Sees Calculated Word Count" do
  scenario "when creating article, word count is saved to database" do
    visit articles_path
    click_link "Create New Article"

    fill_in "Title", with: "Word Count Persistence Example"
    fill_in "Body", with: "First Second Third"

    expect {
      click_button "Create Article"
    }.to change { Article.where(word_count: 3).count }.by(1)
  end

  scenario "after creating the article, the word count is displayed with the title" do
    visit articles_path
    click_link "Create New Article"

    fill_in "Title", with: "Word Count Display Example"
    fill_in "Body", with: "First Second Third"
    click_button "Create Article"

    expect(page).to have_content("Word Count Display Example (3)")
  end
end