require 'rails_helper'

RSpec.feature "GuestCanCreateAccount", type: :feature do

  scenario "user logs in and answers survey question" do

    user = create(:user)
    create(:session_guest_role)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))
    user.roles << Role.find_by(name: "session_guest")

    create(:question)
    create(:question)
    visit root_path

    click_on "Survey"
    first_quest = Question.first
    expect(current_path).to eq survey_path(first_quest.id)
    choose 'answer_answer_yes'
    click_on "Submit"
    expect(user.answers.count).to eq 1
    click_on "Logout"
    expect(current_path).to eq root_path
    expect(user.answers.count).to eq 0

    click_on "View Results"
    expect(page).not_to have_content "Score"

  end

end
