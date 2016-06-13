require 'rails_helper'

RSpec.feature "Navbar", type: :feature do

  scenario "login button disappears when logged in" do

    visit root_path
    expect(page).to have_content('Login')
    expect(page).to have_no_content('Logout')

    user = create(:user)
    create(:session_guest_role)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))
    user.roles << Role.find_by(name: "session_guest")

    # expect(page).to have_no_content('Login')
    # expect(page).to have_content('Logout')

  end
end
