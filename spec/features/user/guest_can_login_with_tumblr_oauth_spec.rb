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

  scenario "user logs in through tumblr oauth and initiates session" do

    user = User.find_or_create_by_auth(auth_info)
    expect(user.name).to eq "tumblr_name"
  end

end
