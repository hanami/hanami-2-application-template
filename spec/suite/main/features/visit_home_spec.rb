RSpec.feature "Loading the home page", :web, :js do
  scenario "It shows the page title" do
    visit "/"
    expect(page).to have_content "Welcome to AppPrototype"

    expect(page).to have_content "Hanami"
    expect(page).to have_content "dry-rb"
    expect(page).to have_content "ROM"
  end
end
