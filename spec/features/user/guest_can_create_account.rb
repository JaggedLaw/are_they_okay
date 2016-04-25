require 'rails_helper'

RSpec.feature "GuestCanCreateAccount", type: :feature do
  scenario "user logs in through tumblr oauth and initiates session" do
    binding.pry
    visit root_path
    expect(Session.count).to eq 0
    click_on "Login"
    click_on "Allow"

    expect(current_path).to eq root_path
    expect(Session.count).to eq 1

  end

end
