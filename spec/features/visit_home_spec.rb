# frozen_string_literal: true

RSpec.feature "Loading the home page" do
  scenario "It shows the page title" do
    visit "/"
    expect(page).to have_content "Welcome to AppPrototype"
  end
end
