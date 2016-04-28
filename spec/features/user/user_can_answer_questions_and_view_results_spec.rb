require 'rails_helper'

RSpec.feature "GuestCanCreateAccount", type: :feature do

  scenario "user logs in and answers survey question" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))
    create_list(:question, 3)
    first_ques_id = Question.first.id
    visit root_path

    click_on "Survey"

    choose 'answer_answer_yes'
    click_on 'Submit'
    expect(Answer.last.answer).to eq "Yes"

    expect(current_path).to eq survey_path(first_ques_id + 1)
    choose 'answer_answer_no'
    click_on 'Submit'
    expect(Answer.last.answer).to eq "No"
    expect(current_path).to eq survey_path(first_ques_id + 2)
    choose 'answer_answer_yes'
    click_on 'Submit'
    expect(Answer.last.answer).to eq "Yes"

    expect(current_path).to eq results_path

    expect(page).to have_text("The following is an assessment based on your answers:")


    # expect(page).to have_text("Enter Your Zip Code To View Nearby Mental Health Resources")
    # expect(page).to have_text("Click here to get a list of amazing podcasts. Other people are going through what you are going through, and they are talking about it.")

    # results page has the illnesses listed that answers point to
    # page has a link to see nearby resources for mental health
    # page has a link to view related podcasts
  end

end
