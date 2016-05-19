require 'rails_helper'

RSpec.feature "GuestCanCreateAccount", type: :feature do

  scenario "user logs in and answers survey question" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))
    create(:session_guest_role)
    user.roles << Role.find_by(name: "session_guest")

    questions = Array.new
    illness1 = Illness.create(name: "depression")
    illness2 = Illness.create(name: "schizophrenia")

    4.times do |i|
      i += 1
      questions << Question.create(question: "#{i}do you like questions")
      Illness.create(user_id: user.id, name: "#{i}illness")
      IllnessQuestion.create(question_id: questions.last.id, illness_id: i, weight: 3 + i)
    end
    first_ques_id = questions.first.id
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
    expect(current_path).to eq survey_path(first_ques_id + 3)
    within("#results") do
      click_on 'View Results'
    end
    expect(current_path).to eq results_path

    expect(page).to have_text("The following is an assessment based on your answers")
    expect(page).to have_text("Your answers point to the possiblility of the following illness:")

  end

  scenario "user answers questions and views results" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))
    create(:session_guest_role)
    user.roles << Role.find_by(name: "session_guest")

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

    expect(page).to have_text("The following is an assessment based on your answers")
    expect(page).to have_text("Your answers point to the possiblility of the following illness:")
    expect(page).to have_text("Depression")
    expect(page).to have_text("Schizophrenia")


    # expect(page).to have_text("Enter Your Zip Code To View Nearby Mental Health Resources")
    # expect(page).to have_text("Click here to get a list of amazing podcasts. Other people are going through what you are going through, and they are talking about it.")

    # results page has the illnesses listed that answers point to
    # page has a link to see nearby resources for mental health
    # page has a link to view related podcasts
  end

end
