require 'faker'

FactoryGirl.define do

  factory :question do
    question Faker::Lorem.sentence
  end

  factory :user do
    name Faker::Name.name
  end

  factory :answer do
    answer "Yes"
  end

  factory :role do
    name "any_role"
  end

  factory :session_guest_role, parent: :role do
    name "session_guest"
  end

end
