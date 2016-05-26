require 'rails_helper'

RSpec.feature "GuestCanCreateAccount", type: :feature do

  scenario "user logs in and answers survey question" do

    user = create(:user)
    create(:session_guest_role)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))
    user.roles << Role.find_by(name: "session_guest")

    quest1 = create(:question)
    create(:question)

    user = create(:user)
    visit survey_path(quest1.id)

    choose 'answer_answer_yes'
    click_on "Submit"
    expect(Answer.count).to eq 1

  end

end
