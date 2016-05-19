require 'rails_helper'

RSpec.feature "ResultsPermissions", type: :feature do

  scenario "logged out user cannot view results page" do

    create(:question)
    visit root_path

    click_on "View Results"
    expect(current_path).to eq root_path
    expect(page).to have_content "You don't have access to view that content"

  end

  scenario "logged in user can view results page" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))

    create(:question)
    visit root_path

    click_on "View Results"
    expect(current_path).to eq root_path
    expect(page).to have_content "You don't have access to view that content"

  end
end
