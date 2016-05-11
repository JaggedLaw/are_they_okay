require 'rails_helper'

RSpec.feature "GuestDoesntLogin", type: :feature do

  scenario "user sees results w out an account" do

    illness1 = Illness.create(name: "depression")
    illness2 = Illness.create(name: "schizophrenia")
    illness3 = Illness.create(name: "bipolar")

    question1 = Question.create(question: "Are you depressed")
    question2 = Question.create(question: "Are you really depressed")
    question3 = Question.create(question: "Are you schizophrenic")
    question4 = Question.create(question: "Are you bipolar")

    IllnessQuestion.create(illness_id: illness1.id, question_id: question1.id, weight: 4)
    IllnessQuestion.create(illness_id: illness1.id, question_id: question2.id, weight: 5)
    IllnessQuestion.create(illness_id: illness2.id, question_id: question3.id, weight: 4)
    IllnessQuestion.create(illness_id: illness3.id, question_id: question4.id, weight: 4)

    visit root_path

    click_on "Survey"
    choose 'answer_answer_yes'
    click_on 'Submit'
    expect(page).to have_content "Would you like to sign in through your Tumblr account or continue as a guest?"
    within "#modal-continue" do
      click_on "Continue as Guest"
    end
    expect(User.last.name).to eq "Guest"

    expect(current_path).to eq survey_path(question1.id)
    choose 'answer_answer_yes'
    click_on 'Submit'
    expect(Answer.first.answer).to eq "Yes"
    expect(current_path).to eq survey_path(question2.id)
    choose 'answer_answer_yes'
    click_on 'Submit'
    expect(Answer.last.answer).to eq "Yes"
    expect(current_path).to eq survey_path(question3.id)
    choose 'answer_answer_yes'
    click_on 'Submit'
    expect(Answer.last.answer).to eq "Yes"
    expect(current_path).to eq survey_path(question4.id)
    within("#results") do
      click_on 'View Results'
    end
    expect(current_path).to eq results_path

    expect(page).to have_text("The following is an assessment based on your answers:")
    expect(page).to have_text("Your answers point to the possiblility of the following illness:")
    expect(page).to have_text("Depression")
    expect(page).to have_text("Schizophrenia")

  end
end
