require 'rails_helper'

RSpec.feature "EpisodeResultsAreLimited", type: :feature do

  scenario "related episodes has link to listen to podcast" do

    user = create(:user)
    create(:session_guest_role)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))
    user.roles << Role.find_by(name: "session_guest")

    illness1 = Illness.create(name: "depression")
    illness2 = Illness.create(name: "schizophrenia")

    question1 = Question.create(id: 1, question: "Are you depressed")
    question2 = Question.create(id: 2, question: "Are you really depressed")
    question3 = Question.create(id: 3, question: "Are you schizophrenic")

    IllnessQuestion.create(illness_id: illness1.id, question_id: question1.id, weight: 4)
    IllnessQuestion.create(illness_id: illness1.id, question_id: question2.id, weight: 5)
    IllnessQuestion.create(illness_id: illness2.id, question_id: question3.id, weight: 4)

    visit root_path

    # answer yes for one disorder
    click_on "Survey"
    first_quest = Question.first
    expect(current_path).to eq survey_path(question1.id)
    choose 'answer_answer_yes'
    click_on "Submit"

    expect(current_path).to eq survey_path(question2.id)
    choose 'answer_answer_yes'
    click_on "Submit"

    expect(current_path).to eq survey_path(question3.id)
    choose 'answer_answer_yes'
    click_on "Submit"

    click_on "View Results"

    click_on "Related Podcasts"
    expect(page).to have_link("listen to podcast")

    click_on("listen to podcast", match: :first)

    expect(page).to have_link("listen to podcast")

  end
end
