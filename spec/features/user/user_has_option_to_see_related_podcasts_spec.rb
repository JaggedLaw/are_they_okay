require 'rails_helper'

RSpec.feature "UserSeesPodcasts", type: :feature do

  scenario "user sees button to pull related podcasts from api" do
    #create Answers that relate to depression
    user = create(:user)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))
    create(:session_guest_role)
    user.roles << Role.find_by(name: "session_guest")

    illness1 = Illness.create(name: "depression")
    illness2 = Illness.create(name: "schizophrenia")

    question1 = Question.create(id: 1, question: "Are you depressed")
    question2 = Question.create(id: 2, question: "Are you really depressed")
    question3 = Question.create(id: 3, question: "Are you schizophrenic")
    question4 = Question.create(id: 4, question: "Are you really schizophrenic")

    IllnessQuestion.create(illness_id: illness1.id, question_id: question1.id, weight: 4)
    IllnessQuestion.create(illness_id: illness1.id, question_id: question2.id, weight: 5)
    IllnessQuestion.create(illness_id: illness2.id, question_id: question3.id, weight: 4)
    IllnessQuestion.create(illness_id: illness2.id, question_id: question4.id, weight: 4)

    answer1 = Answer.create(answer: "Yes", question_id: question1.id)
    answer2 = Answer.create(answer: "Yes", question_id: question2.id)
    answer3 = Answer.create(answer: "Yes", question_id: question3.id)
    answer4 = Answer.create(answer: "Yes", question_id: question4.id)

    visit results_path
    expect(page).to have_content "Click here to view podcasts related to your results"
    click_on "Related Podcasts"
    expect(current_path).to eq episodes_path
    expect(page).to have_content "Related Podcasts"
    # within "#podcast-illness1" do
    #   #use VCR to test api content
      expect(page).to have_content "depression"
    # end
    # within "#podcast-illness2" do
    #   #use VCR to test api content
      # expect(page).to have_content "schizo"
    # end

  end

end
