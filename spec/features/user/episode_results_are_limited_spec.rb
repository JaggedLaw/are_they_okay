require 'rails_helper'

RSpec.feature "EpisodeResultsAreLimited", type: :feature do

  scenario "related episodes return 8 episodes per disorder" do

    user = create(:user)
    create(:session_guest_role)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))
    user.roles << Role.find_by(name: "session_guest")

    illness1 = Illness.create(name: "depression")
    illness2 = Illness.create(name: "schizophrenia")
    illness3 = Illness.create(name: "bipolar")

    question1 = Question.create(id: 1, question: "Are you depressed")
    question2 = Question.create(id: 2, question: "Are you really depressed")
    question3 = Question.create(id: 3, question: "Are you schizophrenic")
    question4 = Question.create(id: 4, question: "Are you bipolar")

    IllnessQuestion.create(illness_id: illness1.id, question_id: question1.id, weight: 4)
    IllnessQuestion.create(illness_id: illness1.id, question_id: question2.id, weight: 5)
    IllnessQuestion.create(illness_id: illness2.id, question_id: question3.id, weight: 4)
    IllnessQuestion.create(illness_id: illness3.id, question_id: question4.id, weight: 4)

    visit root_path

    # answer yes for one disorder
    click_on "Survey"
    first_quest = Question.first
    expect(current_path).to eq survey_path(first_quest.id)
    choose 'answer_answer_yes'
    click_on "Submit"

    # answer yes for another disorder
    # view results page
    # check within results for 1st disorder and make sure no more than 8 were returned
    # check within results for 2nd disorder and make sure no more than 8 were returned
    # end of test


  end
end
