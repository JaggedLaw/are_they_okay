require 'rails_helper'

RSpec.feature "GuestCanCreateAccount", type: :feature do

  scenario "user logs in and answers survey question" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))

    create(:question)
    create(:question)
    user = create(:user)
    visit root_path

    click_on "Survey"
    first_quest = Question.first
    expect(current_path).to eq survey_path(first_quest.id)
    choose 'answer_answer_yes'
    click_on "Submit"
    expect(Answer.count).to eq 1

  end

end
