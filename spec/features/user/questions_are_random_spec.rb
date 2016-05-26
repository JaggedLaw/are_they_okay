require 'rails_helper'

RSpec.feature "SurveyQuestions", type: :feature do

  scenario "questions are random for different sessions" do

    user = create(:user)
    create(:session_guest_role)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))
    user.roles << Role.find_by(name: "session_guest")

    20.times do
      create(:question)
    end

    visit root_path

    click_on "Survey"
    first_session_quest = page.find('.panel-heading').text

    click_on "Logout"
    click_on "Login"

    user2 = create(:user)
    create(:session_guest_role)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user2))
    user2.roles << Role.find_by(name: "session_guest")

    click_on "Survey"
    second_session_quest = page.find('.panel-heading').text

    expect(first_session_quest).not_to eq(second_session_quest)

  end

end
