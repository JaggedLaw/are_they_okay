require 'rails_helper'

RSpec.feature "GuestCanCreateAccount", type: :feature do

  let(:auth_info) do
    OmniAuth::AuthHash.new(
    {
      info: {
        name: "tumblr_name"
      }
    })
  end

  scenario "user logs out and session is cleared" do

    user = User.find_or_create_by_auth(auth_info)
    allow_any_instance_of(ApplicationController).to(
    receive(:current_user).and_return(user))

    expect(user.name).to eq "tumblr_name"
    create(:question)
    create(:question)
    visit root_path
    click_on "Survey"
    choose 'answer_answer_yes'
    click_on 'Submit'
    expect(user.answers.last.id).to eq 1
    click_on "Logout"
    expect(current_path).to eq root_path
    expect(user.answers).to be_empty

  end

end
