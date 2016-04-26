require 'rails_helper'

RSpec.describe User, type: :model do

  let(:auth_info) do
    OmniAuth::AuthHash.new(
    {
      info: {
        name: "tumblr_name"
      }
    })
  end

  it "can create or find a user from auth_info" do
    User.find_or_create_by_auth(auth_info)
    user = User.last

    assert_equal 'tumblr_name', user.name
  end
end
