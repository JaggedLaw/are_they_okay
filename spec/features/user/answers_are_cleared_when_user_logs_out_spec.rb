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
    user.roles.delete_all
    expect(current_path).to eq root_path
    expect(user.answers.count).to eq 0

    click_on "View Results"
    expect(current_path).to eq root_path
    expect(page).to have_content "You don't have access"
    click_on "Login"
    expect(page).to have_content "Would you like to sign in through your Tumblr account or continue as a guest?"
    within "#modal-continue" do
      click_on "Continue as Guest"
    end
    user.roles << Role.find_by(name: "session_guest")
    within "#nav-results" do
      click_on "View Results"
    end
    expect(current_path).to eq results_path

    expect(page).not_to have_content "Score"

  end

end
